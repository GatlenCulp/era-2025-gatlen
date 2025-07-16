"""Command-line plotting utilities for era.

Usage:
    $ python -m era.plots [--input-path PATH] [--output-path PATH]
"""

from pathlib import Path

from loguru import logger
import pandas as pd
import plotly.graph_objects as go
import plotly.io as pio
import typer

from era.config import DATA_DIR, FIGURES_DIR

app = typer.Typer()


@app.command()
def main(
    input_path: Path = DATA_DIR / "raw" / "2024_consolidated_ai_inventory_raw_v2.csv",
    output_path: Path = FIGURES_DIR / "agency_cases_chart.html",
) -> None:
    """Generate bar chart showing total number of cases per agency.

    Args:
        input_path: Path to the input CSV file containing AI inventory data
        output_path: Path where the generated chart will be saved (HTML format)

    Returns:
        None

    Examples:
        >>> main(input_path="era/data/2024_consolidated_ai_inventory_raw_v2.csv",
        ...      output_path="out/reports/figures/agency_cases_chart.html")
    """
    grouped_column = "Agency Abbreviation"

    logger.info(f"Reading data from {input_path}")

    df = pd.read_csv(input_path, encoding="cp1252")

    # Check if Agency column exists
    if grouped_column not in df.columns:
        logger.error(f"'{grouped_column}' column not found in the data")
        logger.info(f"Available columns: {df.columns.tolist()}")
        raise typer.Exit(1)

    # Group by Agency and count cases
    logger.info("Counting cases per agency...")
    agency_counts = (
        df.groupby(grouped_column)
        .size()
        .to_frame(name="case_count")
        .reset_index()
        .sort_values("case_count", ascending=False)
    )

    logger.info(f"Found {len(agency_counts)} unique agencies")

    # Extract data for plotting
    agencies = agency_counts[grouped_column].tolist()
    case_counts = agency_counts["case_count"].tolist()
    total_cases = len(df)

    # Create plotly bar chart
    fig = go.Figure(
        data=[
            go.Bar(
                x=agencies,
                y=case_counts,
                text=case_counts,
                textposition="outside",
                marker_color="steelblue",
                hovertemplate=(
                    "<b>%{x}</b><br>Cases: %{y}<br>Percentage: %{customdata:.1f}%<extra></extra>"
                ),
                customdata=[(count / total_cases) * 100 for count in case_counts],
            )
        ]
    )

    # Update layout for better readability
    fig.update_layout(
        title={
            "text": "Total Number of AI Use Cases by Agency (2024)",
            "x": 0.5,
            "xanchor": "center",
            "font": {"size": 20},
        },
        xaxis_title="Agency",
        yaxis_title="Number of Cases",
        xaxis={"tickangle": 45},
        height=600,
        width=1200,
        showlegend=False,
        margin={"b": 150},  # Increase bottom margin for rotated labels
    )

    # Display the chart in browser
    fig.show()

    # Save chart to file if output path is provided
    if output_path:
        # Ensure output directory exists
        output_path.parent.mkdir(parents=True, exist_ok=True)

        logger.info(f"Saving chart to {output_path}")
        pio.write_html(fig, output_path)

    # Display summary statistics
    logger.info("\n=== Summary Statistics ===")
    logger.info(f"Total agencies: {len(agency_counts)}")
    logger.info(f"Total cases: {total_cases}")
    logger.info(f"Average cases per agency: {total_cases / len(agency_counts):.1f}")

    # Show top 5 agencies in log
    logger.info("\nTop 5 agencies by number of cases:")
    for i, (_, row) in enumerate(agency_counts.head(5).iterrows(), 1):
        agency = row[grouped_column]
        case_count = row["case_count"]
        percentage = (case_count / total_cases) * 100
        logger.info(f"  {i}. {agency}: {case_count} cases ({percentage:.1f}%)")

    logger.success("Chart successfully generated and displayed")


if __name__ == "__main__":
    app()
