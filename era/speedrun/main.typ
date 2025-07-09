#import "./icml-gatlen/icml.typ": (
  icml2025,
  lemmify,
  vruler,
  // Constants and definitions.
  font,
  // Table rulers.
  toprule,
  midrule,
  bottomrule,
  // Theorem typesetting.
  assumption,
  corollary,
  definition,
  lemma,
  proof,
  proposition,
  remark,
  theorem,
)
#import "./logo.typ": LaTeX, LaTeXe

#let affls = (
  era: ("ERA:AI Research Fellowship",),
  fli: ("Future of Life Institute",),
)

#let authors = (
  (
    name: "Gatlen Culp",
    affl: ("era",),
    email: "GatlenCulp@gmail.com",
    equal: true,
  ),
  (
    name: "Hamza Chaudhry",
    affl: ("fli",),
    email: "hamza@futureoflife.org",
    equal: false,
  ),
  (
    name: "Herbie Bradley",
    affl: ("era",),
    email: "mail@herbiebradley.com",
    equal: false,
  ),
  (
    name: "Nandini Shiralkar",
    affl: ("era",),
    email: "nandini@erafellowship.org",
    equal: false,
  ),
)

// Humanity's Security?
#show: icml2025.with(
  title: [Towards Monitoring our Growing National Security Debt with AI:\ Tracking Humanity's Succession of Control to and Susceptibility to Influence from AI Systems],
  authors: (authors, affls),
  keywords: (
    "AI safety",
    "existential risk",
    "civilizational vulnerability",
    "human agency",
    "institutional capture",
    "AI governance",
    "value lock-in",
    "AI alignment",
  ),
  abstract: [
    *Background.* AI is becoming increasingly integrated into every aspect of our lives, institutions, and culture. While productive in the short term, this process risks gradually disempowering humanity, empowering AI-automated institutions that abandon human interests and leaving us vulnerable to a new oligarchy or destructive artificial general intelligence.

    *Action.* This project develops metrics for what I term "AI-induced Civilizational Vulnerability"--the vulnerability arising from integration and the implicit power we place in AI models and those controlling them. I create measurements across five institutions (economic, cultural, educational, research, and political) examining critical effects: collective forgetting as AI masters human skills, AI manipulation of voters and consumers through digital content, ceremonial democracy as governance exceeds human comprehension, emotional dependencies on AI systems, and automated self-improvement pushing humans out of the loop. I aggregate these metrics into a broader vulnerability model, establish influence thresholds, and make policy recommendations. Where data gaps exist, I call for collection by AI labs and governments.

    *Impact.* Like climate scientists making atmospheric changes visible through CO2 measurements, this project makes civilizational vulnerability measurable for policymakers. By establishing thresholds and trends, we transform abstract alignment concerns into urgent national security imperatives, enabling international coordination to prevent races to the bottom, and providing metrics for AI labs' safety cases and responsible scaling policies.
  ],
  bibliography: bibliography("literature-review.bib"),
  header: [Towards Monitoring our Growing National Security Debt with AI],
  // appendix: [
  //   = Appendix

  //   Additional metrics and measurement frameworks will be developed during the research period.
  // ],
  accepted: none,
)

#show: lemmify // Theorems, propositions, definitions, etc.

#vruler(offset: -1.7in)

#let url(uri) = link(uri, raw(uri))

#let comment = text.with(fill: blue.darken(20%).transparentize(40%))

= Outline

Kind of like societal impacts team of UK AISI:
"Societal impacts: evaluating the direct impact of advanced AI systems on both individuals and society—including the extent to which people are affected by interacting with such systems, as well as the types of tasks AI systems are being used for in both private and professional contexts. Chris Summerfield, Oxford University’s Cognitive Neuroscience Professor"


This is a strategy piece for the AI safety community, might be developed to be more later.

0. Goal of paper overall -- Not to develop specific societal scale indiciators or even "introduce them as a new thing", but instead to frame them in the context of AI safety and identify their use cases and a potential methodology of developing them. This may be a blindspot for the AI safety community, which may focus too much on in-lab capabilities and alignment metrics (ex: measuring bias in the lab) of models rather than the downstream slow-moving civilizational effects. These effects are likely influential to policy makers and the public, already present in a meaningful way as LLMs have, likely won't be developed by other interest groups especially in the domains highlighting value misalignment in the wild and power centralization.
1. What is societal scale monitoring
  + Extension of pre-deployment and post-deployment metrics
    + How post-deployment tends to effect the development of models
    + Measuring the relationship between benchmarks, post-deployment studies, and actual societal effects
      + Gap between these benchmarks and actually accomplishing the required tasks (capabilities tests fail to measure the outward effects to some extent. Allows us to gather some feedback on whether our benchmarks are accurate)
  + Possible classes of monitors
    + Vulnerability (How much influence does AI introduce in this domain?)
    + Trigger/Influence (Is the vulnerability above being leveraged?)
    + Human Lock-out (How does AI integration eliminate the power humans have to change this vulnerable regime?)
    + Integration Reinforcement (How strong are the pressures to increase the integration of AI)
    + Cross-Domain Influence (How does this influence other metrics you care about? Ex: Culture influencing politics)
    + Power Consolidation (How are these vulnerabilities concentrated in a single source of)
  + Existing research in this domain
    + UK AISI societal impacts
    + Anthropic Economic Index (ish, more post-deployment monitoring)
    + Research into AI information economy, influence over elections and jazz
    + idk, others.
  + Structure of the paper
2. Why might this be important (Impactful, Tractable, Neglected)
  + Imagining the best case policy scenario -- International Monitoring Committee on AI Influence. Monitors keystone AI indiciators of institutional health (cultural, cognitive, economic, educational, r&d, state), our decreasing influence over them and the fragility of these institutions to coordinated influence by centralized powers (authoritarians, AI developers, power-hungry people, or even the AI itself.) Works together with cultural interest groups, the World Wide Web Consortium (W3C), etc. to make sure that AI isn't steering cultural discourse or converging values over the long-term as it gains greater control over the information economy, social media, personal relationships (AI-human relationships), published works (fed through/edited with models), and thought loops. Identifying which patterns of AI integration we have control over and which ones seem mostly unpreventable. Data used by technological standards institutions like NIST and ISO to set standards over what can/should be automated, to what degree, what amount of human oversight and monitoring is required. Placing societal responsibility on AI labs Reducing arms races by highlighting the internal harm AI integration can have. Setting international goalposts akin to the Paris Agreement to limit global warming to below 2 degrees celsius with concrete ways of achieving this. Making calls for states to slow down their integration. Detecting when media, political, or educational ecosystems have been compromised + manipulated. But also cognitive and individual interactions. Surveys.
  + Maybe labs have to include these studies in their safety cases. Putting societal influences into their responsible scaling policies and internally conducted research.
  + Theory of Change (Impactful)
    + Make better benchmarks
    + Shared across multiple threat models (Measuring the degree to which we are losing control over our institutions) (maybe have some Venn Diagrams or Something, a table checking off which parts are relevant)
      + Gradual Disempowerment (How can we)
      + AI-Enabled Coups (Ex: Military coups, cultural coups, etc.) (How can we prevent centralizing power in the hands of a few people? if these are inevitable, how can we detect when these powers are being leveraged?)
      + Gradual Takeover (How do we prevent or slow-down the worlds where humanity cedes power to misaligned AGI? As a civilization, can we put aside individual first-mover advantages to adoption in favor of preserving human influence?)
    + Requires less assumptions about AI capabilities
    + Better framing (ex: Huawei being a national security issue in the United States)
    + Make metrics visible
    + Helps with forecasting (effects of legislation, geopolitical effects, etc.)
  + Somewhat robust policy implications shared across multiple threat models
    + Gradual Disempowerment
    + Gradual Takeover
    + AI-Enabled Power Centralization
  + Visible now or visible soon (good to measure)
  + Urgent to collect them (certain bits of data might be lost over time, could be influential)
  + Domains that may be overlooked by other interest groups that don't have an AI safety framing (counterfactually would not exist)
    + Which domains are currently looked at (ex: Unemployment)
    + Which domains are currently not looked at (ex:)
3. Why might they not be important
  + God-like AI takeover threat model -- Changes don't matter in this case, our future is already locked-in
  + Speed
    + Capabilities might develop so fast, that by the time meaningful trends show up in the data we will have much bigger fish to fry
    + Policy implications would take too long to implement
  + Care
    + People may not care about the metrics
    + Policy implications might be band-aid solutions in some threat models (ex: societal resilience of)
    + Might result in calls to develop AI defense mechanisms (possibly counterproductive)
    + Might call for GREATER proliferation of AI rather than controlled distribution.
    + These might already be so visible and obvious, such that the metrics are redundant
  + Redundant
    + These might be developed by other institutions and getting them earlier isn't any more impactful
    + Post-deployment data analysis might be fine-grained and informative enough for developing and improving benchmarks.
  + Logistic
    + Too expensive/burdensome to collect
    + Issue with this model overall: Potentially too broad. More likely that there couldn't even exist a single monitoring body, a book could be written about the influence in any of these domains. (ex: Influence on elections, etc.) Each of these fields would likely need to be developed individually and in depth. However, there's value in seeing these indicators as a collective rather than siloed. In the same way there's a strong relationship with capability evals.
4. How can we develop them
  + Spotting Vulnerability -- Vulnerability / Trigger Framework (+ examples in culture, economy, state, education, military, etc.) (include my diagram and other notes)
  + Spotting Good Metrics --
  + Measuring -- Where to get data, things to consider, etc.
5. Further work
  + I'm applying this framework to measuring automated AI R&D, may be updated later with what I find.
6. Conclusion


- This isn't really about outside misuse
- Not really about resiliency, more about prevention and fail-safes


= Outline 2

Intro
1. Claim: AI Safety Needs Societal Scale Monitoring

Background
2. What is Societal-Scale Monitoring
3. Work that is currently being done

Point
4. Why the Gap Matters (ITN + threat model coverage)

Counterpoint
5. Addressing Objections and Limitations

Methodology
5. A Practical Framework for Monitor Development

Conclusion
6. Further Work and Research Agenda
7. Conclusion

= Outline 3 (Security Debt)
1. Intro
  + Background (AI is growing, AI is integrated)
  + AI is a National Security Risk
  + Defining National Security Debt
  + Goal of the paper
  + How to Read this Paper
2. How and Why is National Security Debt being Accumulated?
  + Decomposing National Security
  + Applying various AI threat models to National Security #comment[feels contrived]
  + Comparisons with other Institutional Risks
  + Why AI is uniquely disruptive
3. Measuring our National Security Debt
  + Spotting Vulnerability -- Vulnerability / Trigger Framework (+ examples in culture, economy, state, education, military, etc.) (include my diagram and other notes)
  + Spotting Good Metrics --
  + Measuring -- Where to get data, things to consider, etc.
4. (AIS Community) Reasons for further research
5. (AIS Community) Reasons against further research
6. Further Work & Research Agenda
7. Conclusion

== How is this different from societal impacts of AI at large?
1. Pays attention to gradual trends and incentives rather than one-off events (ex: Misuse)
2. Pays attention to negative (or potentially negative) consequences of AI (rather than gains in productivity and efficiency)
3. Looks at AI from a security, stability, and power perspective
4. Does not make prescriptions on second-order effects (ex: Wealth distribution)
5. Does not look at in-lab model audits
6.

This could just be a field of research distinct from measurements. A frame and model for thinking about these

I'm going to cut away the idea of these being helpful to evaluations, I think that's a separate thing. I can't believe it took me so long to define the boundaries of my proposal and how it is separate from my other ideas.

#pagebreak()

= Introduction
// Perhaps want to avoid national framing? idk.

*AI is Growing.* In recent years, there has been a boom in the domain of artificial intelligence, and in particular, a boom in the development of Large Language Models (LLMs) #comment[introduce statistics on the diffusion of AI models, possibly from AI as Normal Technology] -- a technology that boasts impressive capabilities in the domains of Software Engineering, Content Creation, and more #comment[expand this, perhaps stats]. Such developments have sparked a silicon-valley craze over the development of an Artificial General Intelligence (AGI) #comment[quote "feel the AGI"] -- an AI capable of accomplishing the same tasks as a remote knowledge worker #comment[different definitions, maybe change, worth noting] -- or even an AI beyond human level intelligence ("Superintelligent AI" as I will write throughout), sparked national discussions over job displacement, received trillions(?) of dollars of investment, resulted in international headlines when DeepSeek, a Chinese AI company, released an AI model capable of competing with state-of-the-art LLMs coming out of American AI companies, and had figures like JD Vance call for the rapid development of AI at the Paris AI Summit #comment[cite]. While there are great disagreements over the extent and timeframe AI changes society, there is little disagreement #comment[eh] over whether AI is a transformative general purpose technology on the order of the industrial revolution.

*AI is Integrated with our Institutions.* AI is becoming increasingly embedded in American institutions #comment[should I keep the national framing?] -- economic, cultural/cognitive, education, research & development, and state. At the present moment, we see educators grappling with incorporating AI into the classroom and preventing cheating, software developers taking the day off if their AI-enabled tooling is offline, researchers and journalists raising alarm bells as to how AI could be used to manipulate elections, and growing evidence towards dead-internet theory. As capabilities grow #comment[maybe introduce timelines? idk how much work to do on background] and diffusion continues, the future could see collective forgetting as AI masters human skills, ceremonial democracy as automated governance exceeds human comprehension, emotional dependencies on AI systems, AI enabled military coups, and automated AI research and development pushes humans out of the loop of the same technology powering the modern world. #comment[Better examples, more likely and consequential ones] #comment[also make these less negative].

*Integrated AI is a National Security Risk.* AI has the opportunity to improve corporate and government efficiency, develop new technologies, democratize education, and far more. With so many prospects, it is unsurprising that so many are keen to rapidly develop and implement this technology. And considering the power that comes with owning and exporting this technology, it's unsurprising that the United States has tried maintaining their grip on the technology and their lead over the China. However, the gradual integration of AI into our lives, institutions, and culture leaves humanity (and especially the nations first to embrace the technology) vulnerable to influence -- hard and soft. This paper aims to introduce the idea of a growing national security debt that the pressures to develop AI create and propose some ways of tracking its development.

// this process risks gradually disempowering humanity, empowering AI-automated institutions that abandon human interests and leaving us vulnerable to a new oligarchy or destructive artificial general intelligence.

*Definitions.* #link("https://www.secopsolution.com/blog/what-is-security-debt-how-does-it-work")[_Security debt_], a term borrowed from Security Operations, refers to the accumulation of unresolved security issues over time. Much like technical debt, where developers prioritize quick solutions over more robust, long-term fixes. The longer security debt is left unaddressed, the more difficult and costly it becomes to resolve, potentially leading to severe security breaches and other vulnerabilities.
In this paper, the security being referred to is _national security_, not to be confused with the specific application of AI in cybersecurity or defense #comment[TODO: better wording], which has a broader domain including the security of: #link("https://www.researchgate.net/publication/378049342_ENSURING_THE_SAFETY_OF_CITIZENS_IN_TIMES_OF_WAR_ASPECTS_OF_THE_ORGANIZATION_OF_CIVIL_DEFENSE")[values of the society, state sovereignty, constitutional human freedoms and rights, society and its relations, and more.] Additionally, this paper focuses on the gradual weakening of institutional defenses due to AI
#footnote[Institutional defenses have the opportunity to be strengthened by AI as well #comment[cite lock-in, applies, but maybe an odd paper] #comment[cite AI as normal technology section]. However, AI is more likely to be a disruptive force whose positive influences can only occur after addressing key flaws. #comment[Substantiate]]
as opposed AI-enabled of offensive capabilities such as cyber-attacks or CBRN (Chemical, Biological, Radiological, Nuclear) weapons development #comment[link], although these may also share the description of being under-addressed national security issues.#footnote[This paper also looks at the vulnerabilities and plausible threat of harm, not potential harms itself. The line here is fuzzy, but analogous to "this is a exploitable vulnerability in the economy" versus "this will hurt the economy." #comment[Distinction not clear, maybe not worth making.] #comment[It's also not just "this is disruptive to our way of life", it's being disruptive in a dangerous and gameable way.]]
// https://www.credo.ai/blog/ai-cbrn-risks-governance-lessons-from-the-most-dangerous-misuses-of-ai
// National Security: Underlying values of autonomy of thought and ability to determine our future and things like this.
// ALSO:

#pagebreak()
= How & Why We are Accumulating National Security Debt

*Comparisons of Institutional AI Risk to Others.* In some ways, AI and the risks it elicits are not unique. #comment[AI as Normal Technology does a pretty decent job discussing how pretty narrow AI wouldn't be a wildly new challenge, pull more info from here] In particular, arms races to develop and adopt technology to gain an economic or political edge and developing regulations to internalize externalities is a textbook economics problem.

In some ways, the embedded AI risks pose to  _cultural institutions and cognitive autonomy_ have also been posed by social media algorithms, mass media, internet, and personalized advertising especially over the past two decades, influencing not just public opinion but also legislation (such as car dependent infrastructure in the US #comment[kind of old, not best example]) and elections. Arguably, the global political polarization, hostility, and rise of conspiracy theories have been a result of how the internet has developed and the economic incentives of businesses embedded in algorithms -- which themselves have been shaped by small groups and other institutions, relatively unregulated. #comment[This section feels weakly related to my overall point, relate better]. While these influences are hard to attribute and are scattered across many individual and organizational choices, singular top-down manipulation is also feasible. Following the acquisition of Twitter/X by Elon Musk, large changes were made to the platform and the content that gained popularity, which can be traced back to individual decisions #comment[Cite. Or just remove, contentious in political environment]. About (90%?) of the platform stayed, despite (55%?) being against the changes #comment[cite] -- likely attributable to a kind of lock-in and a difficulty to migrate to other platforms (ex: creators have built their following on there, users accustomed to getting their news there, etc.). Regardless, this is just a single platform and while there are negative effects, they are far from catastrophic. However, the influence over culture should not be underrated -- the effects of media control have been widely studied, often with the perspective of state propaganda, a massive topic of the 20th century as it applies to the Soviet Union and Communist China, and the origin of the term brain washing #comment[okay now it feels like I'm being alarmist ooo 1984 spooky, kind of overused]. Even today, technology has enabled China to influence minds using the Great Firewall, mass surveillance, and content/message censorship. #comment[I don't necessarily want to call out China either] While AI can also enable authoritarian regimes #comment[cite] and worsen existing societal issues #comment[cite], they can also create new vulnerabilities in liberal democracies #comment[maybe don't use these in a policy paper, jk but not really] #comment[At this point, I haven't made much of the connection between AI and this technology, but I kind of want to move on. Maybe this should be its own section].
// Something something information economy. This demonstrates the power over our culture with explicit discussion. Talks about misalignment. Top down control. Something something people also think they free thinkers.

#comment[Likewise...
  - MILITARY -- Nuclear weapons / power (might be more apt) (much easier to develop/share, many other use cases, hard to control)
    - We have competition with other countries to develop, it is kind of military but also kind of a general purpose technology.
    - Computer systems
] #comment[Have to move on, a bit tired and running out of steam on this topic.]

#comment[Other kinds of misalignment risks listed in gradual disempowerment.]

*AI is Uniquely Problematic.* While AI shares many similarities to other technologies, a few properties make AI a particularly destabilizing technology: (a) the massive cross-domain scale of diffusion, (b) rapid development and diffusion, (c) centralization of control #comment[AI coup would say "singular loyalties"], (d) non-detectable secret or misaligned loyalties #comment[mouthful], (e) potential for dependence (and human lock-out / loss of control?) #comment[TODO: Create better differences, be more principled. Also elaborate.]

Unlike financial debt (which elicits imagery of a credit card bill) or technical debt (which involves recognizing and not-implementing best practices), The ai-induced national security debt is more subtle and threatening in some key ways: (a) We don't know how much we owe (how costly is it to address?), (b) We don't know how to pay it (how to address it?), (c) We don't know what the consequences of not paying it are (how bad is the problem?). This paper attempts to address each of these. #comment[kind of vague, unnecessarily visual?]

// https://www.nsed.gov.hk/national_security/index.php?a=national_security_main_focus&l=en
// 
// *The Incentives are Too Great*

// *Other Work.*
// - AI-enabled coups paper [cite] uses a very similar framing, but applied specifically to military technology.

// Also who are we paying lol

// *Action.* This project develops metrics for what I term "AI-induced Civilizational Vulnerability"--the vulnerability arising from integration and the implicit power we place in AI models and those controlling them. I create measurements across five institutions (economic, cultural, educational, research, and political) examining critical effects:  I aggregate these metrics into a broader vulnerability model, establish influence thresholds, and make policy recommendations. Where data gaps exist, I call for collection by AI labs and governments.

// *Impact.* Like climate scientists making atmospheric changes visible through CO2 measurements, this project makes civilizational vulnerability measurable for policymakers. By establishing thresholds and trends, we transform abstract alignment concerns into urgent national security imperatives, enabling international coordination to prevent races to the bottom, and providing metrics for AI labs' safety cases and responsible scaling policies.


#pagebreak()
