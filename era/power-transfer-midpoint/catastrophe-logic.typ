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
#import "@preview/lemmify:0.1.8": thm-selector
#import "./logo.typ": LaTeX, LaTeXe
// #import "@preview/drafting:0.2.2": margin-note, set-margin-note-defaults
#import "@preview/wordometer:0.1.4": total-words, word-count
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
#import "@preview/glossarium:0.5.8": Gls, Glspl, gls, glspl, make-glossary, print-glossary, register-glossary
#show: make-glossary

#let entry-list = (
  (
    key: "agent",
    short: "agent",
    description: [An entity capable of taking actions from a defined action space. In our framework, agents can serve as either controllers (exerting influence) or responders (being influenced).],
  ),
  (
    key: "action-space",
    short: "action space",
    description: [The set of possible actions $cal(W) = {w_1, ..., w_n}$ available to an agent. Power requires $|cal(W)| > 1$ (genuine choice between alternatives).],
  ),
  (
    key: "dahlian-power",
    short: "Dahlian Power",
    description: [Power as formalized by Dahl (1957): $M(A/B : W, x) := Pr(B, x | A, w) - Pr(B, x | A, overline(w))$. Measures the difference in probability of response $x$ when agent $A$ takes action $w$ versus not taking action $w$.],
  ),
  (
    key: "controller",
    short: "controller",
    description: [An agent that attempts to influence the behavior of other agents (responders) through its actions. The agent $A$ in a Dahlian power relationship $A/B$.],
  ),
  (
    key: "responder",
    short: "responder",
    description: [An agent whose behavior is potentially influenced by controllers. The agent $B$ in a Dahlian power relationship $A/B$. Can be modeled as either an agent or environmental black box.],
  ),
  (
    key: "environment",
    short: "environment",
    description: [A non-agential entity that responds probabilistically to agent actions without deliberate decision-making. Represented by probability distributions $Pr(E = x | A, w)$ rather than utility-maximizing behavior.],
  ),
  (
    key: "means-response-chain",
    short: "means-response chain",
    description: [A sequence of agents where each serves as both responder to upstream agents and controller of downstream agents: $A^((0)) -> A^((1)) -> ... -> A^((N))$. Cannot be modeled coherently within Dahlian framework.],
  ),
  (
    key: "power",
    short: "power",
    description: [The intuitive notion of influence, control, or ability to affect outcomes. While this term encompasses many different conceptions across disciplines, we focus on developing rigorous mathematical foundations for analyzing power relationships between agents.],
  ),
  (
    key: "absolute-power",
    short: "absolute power",
    description: [Power conceptualized as an intrinsic property of individual agents, independent of relationships. We prove this approach is insufficient for modeling power dynamics.],
  ),
  (
    key: "relative-power",
    short: "relative power",
    description: [Power conceptualized as relational properties between agents. Forms a proper superset of absolute power models and is necessary for analyzing complex power dynamics.],
  ),
  (
    key: "black-box-abstraction",
    short: "black box abstraction",
    description: "Modeling complex intermediate processes (like means-response chains) as environmental probability functions, losing structural information about how influence propagates.",
  ),
  (
    key: "multi-controller",
    short: "multi-controller dynamics",
    description: [Scenarios where multiple agents ${A_1, ..., A_n}$ simultaneously influence a single responder $B$, requiring analysis of joint action profiles $bold(w) = (w_1, ..., w_n)$.],
  ),
  (
    key: "scope-limitation",
    short: "scope limitation",
    description: [Dahlian power's inability to compare power across different response variables (e.g., power over policy $A$ versus power over policy $B$), limiting cross-domain power analysis.],
  ),
  (
    key: "utility-alignment",
    short: "utility alignment",
    description: [When agents have proportional utility functions: $U_A(s) prop U_B(s) space forall s in cal(S)$. Under perfect alignment, power becomes behaviorally irrelevant.],
  ),
  (
    key: "behavioral-alignment",
    short: "behavioral alignment",
    description: "When agents choose similar actions despite potentially different underlying utilities. Distinct from utility alignment and more relevant for power analysis.",
  ),
  (
    key: "relevant-state-space",
    short: "relevant state space",
    description: [The subset of states $cal(S)_A := {s in cal(S) : partial U_A \/ partial s != 0}$ where agent $A$'s utility function has non-zero gradient. Power analysis must be defined over relevant rather than complete state spaces.],
  ),
)

#register-glossary(entry-list)

#let agent-fill = gradient.radial(blue.lighten(80%), blue.lighten(40%), center: (30%, 20%), radius: 80%)
#let env-fill = gradient.radial(green.lighten(80%), green.lighten(40%), center: (30%, 20%), radius: 80%)
#let adv-fill = gradient.radial(red.lighten(80%), red.lighten(40%), center: (30%, 20%), radius: 80%)
#let z-stroke = (thickness: 0.5pt, paint: gray)
#let z-fill = gray.lighten(60%)
#let agent-radius = 1em
#let z-radius = 0.7em
#let env-boundary = (paint: green.darken(30%), thickness: 2pt, dash: "dashed")
#let action-stroke = (thickness: 0.8pt, paint: blue.darken(20%))
#let z-interaction-stroke = (thickness: 0.6pt, paint: purple.darken(10%))

#let comment-text = text.with(fill: blue.darken(20%).transparentize(40%))
#let todo-text = text.with(fill: red.darken(20%).transparentize(40%))
#let comment(content, hide: false) = {
  if not hide {
    comment-text[💬 #content]
  }
}
#let todo(content, hide: false) = {
  if not hide {
    todo-text[📋 #content]
  }
}


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
  title: [
    // Power-Centric Model of Risk\ &\
    Mathematical Foundations for Power Analysis in Complex Systems],
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
    *Mathematical Framework for Power Analysis.* Understanding societal risks—from institutional capture to AI-enabled power concentration—requires rigorous models of how power operates between agents with complex, evolving relationships. I develop a formal mathematical framework for power dynamics by extending Dahl's influential 1957 theory, addressing its fundamental limitations through game-theoretic foundations.\
    *Key Contributions.* First, I demonstrate why absolute power models are insufficient, proving that relational power frameworks form a proper superset of absolute ones. Second, I show that Dahlian power cannot handle influence chains or compare power across different domains—critical limitations for analyzing complex systems. Third, I establish that utility functions are necessary for coherent power analysis, formalizing when power becomes behaviorally meaningful. This framework provides theoretical foundations for analyzing dangerous power dynamics in contexts where agents may lack clear utility functions or act irrationally over extended periods.
  ],
  bibliography: bibliography("literature-review.bib"),
  header: [Mathematical Foundations for Power Analysis in Complex Systems],
  appendix: [
    = Glossary
    #print-glossary(
      entry-list,
    )
    = Generalizing Dahl to Markov Nets, HMMs, and MDPs

    // MDPs later

    #image("./figs/markov-net.png")
    #image("./figs/mdp.png")

    In broad strokes, Dahl's theory of power is similar to the rich literature of markov nets in computer science literature. With a few differences:
    - Taken from the perspective of actions that players take. (However these can be mapped onto priors in a markov net so long as there are no loops, which of course there are. Might not actually be an issue.)
    - Control must be causal. Since this is near-impossible to prove in-full, it suffices to say that it's certainly not causal if the response happens before the action.

    A few nice properties and intuitions can however can be carried over:
    - Markov blankets (You can isolate control by)
    - Can be mapped to time-series HMMs.

    Notoriously very difficult. #todo[Maybe also show some existing CS problem to apply control in a new context.] #todo[Also maybe see what other studies of power exist out there that looked at causal relationships in this way. Certainly not a new understanding of power, just one that wasn't looked at broadly.]

    Already we are at a point where we can define control in MDPs, one of the most fundamental structures in reinforcement learning and applicable to many scenarios. #todo[Can we apply this to some textbook MDP scenario?] #todo[Not sure I should transition to MDPs without bringing in utility as a pre-requisite of power.]

    // Might require multi-agent MDPs

  ],
  accepted: none,
)


#show: word-count
#show: lemmify // Theorems, propositions, definitions, etc.

// Add styled blocks for definitions only
#show thm-selector("thm-group", subgroup: "definition"): it => block(
  fill: rgb("#f8f9fa"),
  stroke: (left: rgb("#007acc") + 3pt),
  inset: (left: 15pt, right: 10pt, top: 8pt, bottom: 8pt),
  radius: (right: 4pt),
  breakable: false,
  it,
)

#vruler(offset: -1.7in)

#let url(uri) = link(uri, raw(uri))

#set math.equation(numbering: none)
#set figure(placement: none)
#set quote(block: true, quotes: true)

#let comment-text = text.with(fill: blue.darken(20%).transparentize(40%))
#let todo-text = text.with(fill: red.darken(20%).transparentize(40%))
#let comment(content, hide: false) = {
  if not hide {
    comment-text[💬 #content]
  }
}
#let todo(content, hide: false) = {
  if not hide {
    todo-text[📋 #content]
  }
}

// #let theorem(title, body) = {
//   block(fill: rgb("#f0f0f0"), inset: 10pt, radius: 4pt, [
//     *Theorem #title.* #body
//   ])
// }

// #let definition(title, body) = {
//   block(fill: rgb("#e8f4f8"), inset: 10pt, radius: 4pt, [
//     *Definition #title.* #body
//   ])
// }

// #set-margin-note-defaults(hidden: false)

// = Logic of Catastrophe

// #todo[Not remotely started, need to build from scratch. Might be better to bring into scope after power.]

// https://docs.google.com/document/d/1NwKtkjn2vFRpE3Qqt-dmG1bse5U00ekGyignlqV07aY/edit?tab=t.0#heading=h.yt8mh4gegk22
// == Modeling States/Actors/Environment
// $
//   s in S"tates"
// $
// $
//   x in X "(actors = people, inanimate object, environment)"
// $
// $
//   "environment", e in X \ "(One actor, essentially representing 'everything else')"
// $
// $
//   forall s in S, exists x, y. \
//   x != y and x, y in s "(ie: All states have two unique actors)"
// $
// $
//   forall s in S. e in s "(ie: Environment is in all states)"
// $


// Logical Relationships & Progression of Claims
// Power Volume and Danger
// - Little power $=>$ little effects $=>$ localized & manageable danger
// - Large danger => large power

// Dynamics
// - Balance of power $and$ agents $=>$ equilibrium
// - Equilibrium $!=>$ no danger
// - Equilibrium $and$ something(?) $=>$ no danger

// == Types of Conflict
// - Person v Person
// - Person v Self
// - Person v Society
// - Person v Nature

// https://en.wikipedia.org/wiki/Potential_theory


// #pagebreak()

// Combining the above, we will say:
// - *Power* of $A$ over $B$ is the ability for $A$ to determine the rewards/punishments of $B$ (Independent of recognition which is dissimilar to French/Raven)

// #todo[Talk about in more detail. Just general background on power. This should perhaps come first in the paper.]

= Introduction

Understanding #gls("power") dynamics is critical for analyzing societal risks, from institutional capture to AI-enabled concentration of control. Yet despite decades of research across sociology, political science, and economics, we lack rigorous mathematical frameworks for modeling how #gls("power") operates in complex multi-agent systems.

Consider these scenarios: A social media algorithm subtly shapes millions of political opinions through content curation. A powerful corporation influences regulatory policy through a web of lobbying relationships. An AI system gradually assumes decision-making authority across critical infrastructure. Each involves intricate #gls("power") relationships that existing theories struggle to model precisely.

*The Challenge.* Current approaches to #gls("power") analysis suffer from fundamental limitations. Sociological theories offer rich conceptual frameworks but lack mathematical precision needed for quantitative analysis. Game-theoretic models provide formal rigor but assume rational #glspl("agent") with well-defined utility functions—assumptions that often fail in real-world #gls("power") dynamics where #glspl("agent") act irrationally, preferences evolve, or utility functions remain unclear.

*Our Approach.* This paper develops a formal mathematical framework for #gls("power") analysis by extending Dahl's seminal 1957 theory of #gls("power"). Dahl's framework -- "A has #gls("power") over B to the extent that A can get B to do something B would not otherwise do"—provides an intuitive starting point but faces severe limitations when analyzing complex systems.

*Contributions.* We make three key theoretical contributions. First, we prove that models of #gls("relative-power") form a proper superset of #gls("absolute-power") models, establishing why relational frameworks are necessary. Second, we demonstrate that #gls("dahlian-power") cannot handle influence chains or enable cross-domain #gls("power") comparisons -- critical limitations for analyzing modern #gls("power") structures. Third, we establish formal conditions under which utility functions become necessary for coherent #gls("power") analysis.

*Roadmap.* §2 introduces our formal modeling approach and contextualizes it within existing #gls("power") literature. §3 formalizes and extends Dahl's framework, revealing its structural limitations. §4 proves the inadequacy of #gls("absolute-power") models. §5 demonstrates why utility functions are essential for meaningful #gls("power") analysis. Together, these results provide theoretical foundations for analyzing dangerous #gls("power") dynamics in complex systems.

#pagebreak()
= Towards a Formal Model of Power

*The Literature Landscape.* #Gls("power") theory suffers from conceptual fragmentation. Existing approaches fall into two problematic categories: either loosely connected sociological definitions that resist formalization, or rigorous mathematical models confined to narrow domains (e.g., cooperative game theory's #gls("power") indices).#footnote[This reflects a common trade-off in formal modeling: rigor versus generality. Cooperative game theory's power indices (Shapley, Banzhaf, etc.) provide precise mathematical definitions but only apply within specific institutional contexts like weighted voting games #todo[confirm]. Conversely, sociological theories achieve broad applicability by sacrificing mathematical precision. The challenge is developing frameworks that maintain both formal rigor and sufficient generality to analyze diverse power structures across different domains.] Each theoretical tradition critiques its predecessors while offering new definitions, creating a tower of competing frameworks rather than cumulative progress.#footnote[These sociological approaches capture different but related aspects of power, yet lack mathematical precision needed for quantitative analysis: Dahl's behavioral definition focuses on observable influence over actions but cannot handle indirect influence chains or enable cross-domain power comparisons. French and Raven's taxonomy (reward, coercive, legitimate, referent, expert power) describes power sources but provides no framework for measuring or comparing power magnitudes -- it remains unclear whether these categories are irreducible or whether some (e.g., legitimate power) can be decomposed into others (reward/coercive mechanisms). Lukes' three dimensions examine different levels of decision-making processes (overt conflict, covert agenda-setting, ideational preference-shaping) but offer descriptive taxonomies rather than predictive models. Actor-Network Theory treats power as emergent from network relationships but explicitly resists formal quantification, limiting its predictive capacity. While each tradition illuminates important facets—behavioral outcomes, psychological bases, structural processes, relational emergence—none provides the mathematical foundations necessary for rigorous analysis of complex, multi-level power dynamics.]

*Contemporary Applications.* Formal #gls("power") modeling has gained urgency across multiple domains. In reinforcement learning, researchers need to determine when #glspl("agent") pursue aligned objectives despite different behaviors and capabilities.#footnote[See Jason X, PhD student at Cambridge University] AI governance researchers seek to formalize how labor-replacing AI disrupts social contracts and how economic #gls("power") converts to political influence.#footnote[See Liam Patell at GovAI] While my framework may not immediately solve these challenges, it establishes necessary theoretical foundations.

*Methodological Approach.* Rather than proposing yet another universal "Theory of #Gls("power")," we develop rigorous mathematical foundations for one influential perspective -- Dahl's concept of #gls("power") from 1957 -- then systematically extend it. This approach allows us to either: (a) formally relate competing definitions to our framework, (b) demonstrate their mathematical incoherence, (c) identify behaviorally irrelevant distinctions, or (d) establish approximation boundaries for complex realities.

As Dahl himself anticipated, we may never achieve "a single, consistent, coherent 'Theory of Power'" but instead must develop "theories of limited scope" that prove useful within specific research contexts.#footnote[Dahl's Concept of Power 1957: "Thus we are not likely to produce certainly not for some considerable time to come anything like a single, consistent, coherent 'Theory of Power.' We are much more likely to produce a variety of theories of limited scope, each of which employs some definition of power that is useful in the context of the particular piece of research or theory but different in important respects from the definitions of other studies."]

*The Value of Mathematical Formalization.* Formal models provide conceptual precision beyond their mathematical machinery. When researchers invoke "prisoner's dilemmas" or "principal-#gls("agent") problems," they rarely solve explicit equations -- instead, they leverage rigorous conceptual frameworks that clarify otherwise murky situations. Similarly, our formal #gls("power") framework aims to provide precise analytical tools for recognizing and categorizing #gls("power") dynamics across diverse contexts. The mathematics enables conceptual clarity, not computational solutions.

*Our Strategy.* We begin with Dahl's 1957 formalization -- "$A$ has #gls("power") over $B$ to the extent that $A$ can get $B$ to do something $B$ would not otherwise do" -- because it offers both intuitive appeal and mathematical tractability. We then systematically identify its limitations, demonstrate required extensions, and establish what mathematical properties any complete #gls("power") theory must satisfy. This constructive approach reveals not just Dahl's shortcomings, but fundamental constraints on #gls("power") modeling itself.

// _Note: State space may disappear and instead become the "behavior" of the environment which itself can be influenced via evolutionary game theory. This will come up later._


#pagebreak()
= Generalized Dahl Framework

== Defining Dahlian Power

I start with Dahl's influential concept, which I term *#gls("dahlian-power")* to distinguish it from other #gls("power") definitions we'll encounter (@dahlian-power-rel).

// We will start from Dahl's concept of power. However, since we define power differently, we will call Dahl's power "*control*". Instead of defining "People", they will be called "Players" to fit in with the later game theory formulations.

#remark(name: "Dahl's Intuition")[
  Consider two scenarios from the original essay #footnote[
    The full quote from the Concept of Power (Dahl 1957): "Suppose I stand on a street corner and say to myself, "I command all automobile drivers on this street to drive on the right side of the road"; suppose further that all the drivers actually do as I "command" them to do; still, most people will regard me as mentally ill if I insist that I have enough power over automobile drivers to compel them to use the right side of the road. On the other hand, suppose a policeman is standing in the middle of an intersection a t which most traffic ordinarily moves ahead; he orders all traffic to turn right or left; the traffic moves as he orders it to do. Then it accords with what I conceive to be the bedrock idea of power to say that the policeman acting in this particular role evidently has the power to make automobile drivers turn right or left rather than go ahead. My intuitive idea of power, then, is something like this: A has power over B to the extent that he can get B to do something that B would not otherwise do."
  ]

  1. A person on a street corner "commanding" drivers to use the right side (which they already do)
  2. A police officer directing traffic to turn when it would normally go straight.

  Only the second demonstrates genuine #gls("power") -- the ability to cause behavior that wouldn't otherwise occur.
]

#definition(name: "Dahlian Power w/ 2-means")[
  #figure(
    caption: [Basic Dahlian Power relationship: Agent A uses means W to influence Agent B's response x.],
  )[
    #align(center)[
      #diagram(
        node-stroke: .1em,
        node-fill: agent-fill,
        spacing: 4em,
        node((0, 0), [$A$], radius: 2em),
        edge([$W$], "-|>"),
        node((1, 0), [$B$], radius: 2em),
        edge([$x$], "-|>"),
      )
    ]
  ] <dahlian-power-rel>
  #Gls("agent") $A$'s #gls("dahlian-power") over $B$ with respect to the response $x$ by means $w$ is:
  $
    M(A/B : W, x) := Pr(B, x &| A, w) - Pr(B, x | A, overline(w))
  $
  Where:
  - $Pr(B, x &| A, w)$ is the probability that $B$ takes action $x$ given $A$ took action $w$.
  - $overline(w)$ is $A$ not taking action $w$ and $W$ is the unresolved action
]

#remark(name: "Key Components")[
  Dahl's model is made up of the following components:
  1. *#Glspl("agent").* At least two #glspl("agent") each of which have binary *actions* (e.g. take action $w$ or not)
  2. *Connection.* Some mechanism $cal(I)$ linking #glspl("agent") (unspecified)
  3. *Probability.* Distribution over #gls("agent")-action pairs

  What this doesn't require:
  1. *Utility.* Doesn't say what either #gls("agent") prefers.
  2. *Causal Relationship.* Dahl explicitly avoids requiring causal traces -- only observable behavioral differences matter. However, does note causality is required for real #gls("power"), hence the means must precede the response temporally.
  3. *Practicality.* Doesn't say whether the #gls("controller") actually would or would not take action $w$ in practice.
]

#remark(name: "Dahlian Power Over Environment")[
  Dahl's framework extends naturally beyond human responders. Since the mathematical formalism only requires probabilistic responses $Pr(x | A, w)$, we can analyze agent power over environmental outcomes.(@environment-blackbox).

  Letting $E := "environment"$:

  $
    M(A/E : W, x) := max_(w^+ in cal(W)) & Pr(E = x | A, w^+) \
                                         & - max_(w^- in cal(W)) Pr(E = x | A, w^-)
  $

  #figure(
    caption: [Environmental power: Agent actions influence environmental states or outcomes.],
    placement: bottom,
  )[
    #align(center)[
      #diagram(
        node-stroke: .1em,
        node-fill: agent-fill,
        spacing: 4em,
        node((0, 0), [$A$], radius: 2em, name: <agent>),
        edge(<agent>, (1, 0), [$W$], "-|>"),
        node((1, 0), [Env.], radius: 2em, fill: env-fill, name: <env>),
        edge(<env>, (2, 0), [$x$], "-|>"),
      )
    ]
  ] <environment-blackbox>

  *Example:* A company's carbon emissions policy $W$ influences climate outcomes $x$ (temperature rise).

  This captures intuitive notions of "environmental power" while maintaining Dahl's rigorous probabilistic foundation.
]

== Generalizing Beyond Binary Means

Dahl's binary framework (action taken or not) is limiting. Real #glspl("agent") choose from multiple options.

#definition(name: "Dahlian Power w/ n-means")[
  Let $#gls("action-space") cal(W) := {w_1, ..., w_n | n in NN^+}$. Then:
  $
    M(A/B : W, x) := max_(w^+ in cal(W)) & Pr(B, x | A, w^+) \
                                         & - max_(w^- in cal(W)) Pr(B, x | A, w^-)
  $
  This measures $A$'s maximum influence over $B$'s likelihood of taking action $x$.
]

#lemma[When $|cal(W)| = 1$ (no choice), #gls("dahlian-power") $M = 0$, fitting our intuition that #gls("power") requires agency.]

#comment[I think Dahl actually notes that you need similar means as well. Look back into this.]

== Multi-Agent Dahlian-Power

#figure(
  caption: [Multi-controller dynamics: Multiple agents $A_1, ..., A_n$ simultaneously influence responder B.],
)[
  #align(center)[
    #diagram(
      node-stroke: .1em,
      node-fill: agent-fill,
      spacing: 4em,
      node((0, 1), [$A_n$], radius: 2em),
      node((0, 0.5), [$dots.v$], fill: none, stroke: none),
      edge((0, 1), (1, 0.5), [$W_n$], "-|>"),
      node((0, 0), [$A_1$], radius: 2em),
      edge([$W_1$], "-|>"),
      node((1, 0.5), [$B$], radius: 2em),
      edge([x], "-|>"),
      // edge((0, 0), (0, 0), `read()`, "--|>", bend: 130deg),
    )
  ]
] <fig-multi-controller>


Real #gls("power") dynamics rarely involve just one #gls("controller"). Consider the example from Dahl's original paper where multiple legislators influence the outcome of a policy being passed or not (@fig-multi-controller):


When multiple #glspl("controller") ${A_1, ..., A_n}$ simultaneously influence the #gls("responder") $B$, we need to extend our framework. Each #gls("agent") $A_i$ can take actions from their #gls("action-space") $cal(W)_i$, creating a joint action profile $bold(w) = (w_1, ..., w_n)$.

Dahl provides two comparative measures for ranking #glspl("controller") with respect to a specific outcome $x$:

#definition(
  name: "Marginal Dahlian Power",
)[
  #figure(
    caption: [Marginal power analysis: Agent $A_1$ is focal (blue), while other agents $A_2, ..., A_n$ are marginalized (gray).],
  )[
    #align(center)[
      #diagram(
        node-stroke: .1em,
        node-fill: agent-fill,
        spacing: 4em,
        // Agents arranged vertically on left
        node((0, -0.6), [$A_1$], radius: 2em, name: <a1>),
        node((0, 0), [$A_2$], radius: 2em, fill: gray, name: <a2>),
        node((0, 0.4), [$dots.v$], fill: none, stroke: none, name: <dots>),
        node((0, 0.8), [$A_n$], radius: 2em, fill: gray, name: <an>),
        // Responder on right
        node((1, 0), [$B$], radius: 2em, name: <b>),
        // Edges from agents to responder
        edge(<a1>, <b>, [$W_1$], "-|>"),
        edge(<a2>, <b>, [$W_2$], "-|>"),
        edge(<an>, <b>, [$W_n$], "-|>"),
        // Edge from responder to outcome
        edge(<b>, (2, 0), [x], "-|>"),
      )
    ]
  ] <fig-marginal-dahlian-power>

  Let $cal(X) := "Set of possible responses"$, then:

  The marginal power of $A_i$ in optimizing for a specific response $x in cal(X)$ relative to a control condition $w_i^0$ (baseline action) is obtained by marginalizing over the expected actions of other controllers:#footnote[This is not the exact definition that Dahl provides, but a more general one.]
  $
    M_+(A_i) & := max_(w_i in cal(W)_i) EE_(bold(w)_(-i) ~ pi_(-i)) [Pr(x | A_i, w_i, bold(w)_(-i))] \
             & - EE_(bold(w)_(-i) ~ pi_(-i)) [Pr(x | A_i, w_i^0, bold(w)_(-i))] \
    M_-(A_i) & := max_(w_i in cal(W)_i) EE_(bold(w)_(-i) ~ pi_(-i)) [Pr(overline(x) | A_i, w_i, bold(w)_(-i))] \
             & - EE_(bold(w)_(-i) ~ pi_(-i)) [Pr(overline(x) | A_i, w_i^0, bold(w)_(-i))] \
    M^*(A_i) & := M_+(A_i) + M_-(A_i)
  $

  where $pi_(-i)$ represents the distribution over other agents' action profiles $bold(w)_(-i) = (w_1, ..., w_(i-1), w_(i+1), ..., w_n)$, and $w_i^0$ is agent $A_i$'s baseline or "do nothing" action that serves as the control condition.#footnote[If you don't care about $M_-$ or $M_+$, it may make more sense to omit a control action and just focus on $M^*$. This may as well be the case if only two actions are available and a control isn't well defined.]

  This measures agent $A_i$'s maximum influence over outcome $x$ when accounting for uncertainty in other agents' behavior. #footnote[Dahl mentions the *Problem of the Chameleon* in his original paper to describe the effect that $A_i$ exerts the most power when they take the actions maximizing/minimizing $Pr(x | A_i, w_i)$. This was called the problem of the chameleon because, in Dahl's original problem, he was looking at senators and passing legislation -- senators could maximize their measured power by mirroring how everyone else voted. There is an emperical problem he encountered with collecting data in this way, but the theoretical issue with comparative Dahlian Power and its indifference towards preferences will be adjusted later.]
]

#definition(
  name: "Pairwise-Conflict Dahlian Power",
)[
  #figure(
    caption: [Pairwise-conflict power analysis: Agent $A_1$ is focal (blue), $A_2$ is adversarial (red), while other agents $A_3, ..., A_n$ are marginalized (gray).],
  )[
    #align(center)[
      #diagram(
        node-stroke: .1em,
        node-fill: agent-fill,
        spacing: 4em,
        // Agents arranged vertically on left
        node((0, -0.6), [$A_1$], radius: 2em, name: <a1>),
        node((0, 0), [$A_2$], radius: 2em, fill: adv-fill, name: <a2>),
        node((0, 0.6), [$A_3$], radius: 2em, fill: gray, name: <a3>),
        node((0, 1), [$dots.v$], fill: none, stroke: none, name: <dots>),
        node((0, 1.5), [$A_n$], radius: 2em, fill: gray, name: <an>),
        // Responder on right
        node((1, 0), [$B$], radius: 2em, name: <b>),
        // Edges from agents to responder
        edge(<a1>, <b>, [$W_1$], "-|>"),
        edge(<a2>, <b>, [$W_2$], "-|>"),
        edge(<a3>, <b>, [$W_3$], "-|>"),
        edge(<an>, <b>, [$W_n$], "-|>"),
        // Edge from responder to outcome
        edge(<b>, (2, 0), [x], "-|>"),
      )
    ]
  ] <fig-conflict-dahlian-power>
  For pairwise comparison between agents $A_i$ and $A_j$ regarding outcome $x$, where $A_j$ optimizes against $A_i$ while marginalizing over all other agents:
  $
    M_+ ''(A_i) & := max_(w_i in cal(W)_i) min_(w_j in cal(W)_j) EE_(bold(w)_(-i,-j) ~ pi_(-i,-j)) [ \
                & Pr(x | A_i, w_i, A_j, w_j, bold(w)_(-i,-j)) \
              ] \
    M_- ''(A_i) & := max_(w_i in cal(W)_i) min_(w_j in cal(W)_j) EE_(bold(w)_(-i,-j) ~ pi_(-i,-j)) [ \
                & Pr(overline(x) | A_i, w_i, A_j, w_j, bold(w)_(-i,-j)) \
              ] \
       M''(A_i) & := M_+ ''(A_i) + M_- ''(A_i)
  $
  where $pi_(-i,-j)$ represents the distribution over all other agents' action profiles, and agent $A_i$ maximizes their influence while agent $A_j$ minimizes it.

  Agent $A_i$ has greater adversarial power than $A_j$ if:
  $
    M''(A_i) > M''(A_j)
  $

  This measures agent $A_i$'s maximum sway over outcome $x$ when facing optimal opposition from agent $A_j$.#footnote[Dahl used this pairwise power to form a rough ranking of power among legislators from limited voting data.]
]

It's reasonable to assume coalitions could form between our controllers, expanding their power beyond just a single agent. We can replace the original controllers with the new coalition as a singular controller, redefining the means of the coalition to be a combination of the original means.

#definition(name: "Combined Dahlian Power")[
  #figure(
    caption: [Coalition power analysis: Agents $A_1, A_2$ collaborate (matching blue), while $A_3, ..., A_n$ remain independent (gray).],
  )[
    #align(center)[
      #diagram(
        node-stroke: .1em,
        node-fill: agent-fill,
        spacing: 4em,
        // Coalition members
        node((0, -0.6), [$A_1$], radius: 2em, name: <a1>),
        node((0, 0), [$A_2$], radius: 2em, name: <a2>),
        // Independent agents
        node((0, 0.6), [$A_3$], radius: 2em, fill: gray, name: <a3>),
        node((0, 1), [$dots.v$], fill: none, stroke: none, name: <dots>),
        node((0, 1.4), [$A_n$], radius: 2em, fill: gray, name: <an>),
        // Responder
        node((1, 0.4), [$B$], radius: 2em, name: <b>),
        // Coalition edges (grouped)
        edge(<a1>, <b>, [$bold(W)_C$], "-|>"),
        edge(<a2>, <b>, "-|>"),
        // Independent edges
        edge(<a3>, <b>, [$W_3$], "-|>"),
        edge(<an>, <b>, [$W_n$], "-|>"),
        // Outcome
        edge(<b>, (2, 0.4), [$x$], "-|>"),
      )
    ]
  ] <fig-combined-dahlian-power>

  For coalition of controllers (referring to their indices) $C subset.eq {1, ..., n}$ with joint action space $cal(W)_C = times.big_(i in C) cal(W)_i$:
  $
    M_+(C) & := max_(bold(w)_C in cal(W)_C) EE_(bold(w)_(-C) ~ pi_(-C)) [Pr(x | C, bold(w)_C, bold(w)_(-C))] \
    M_-(C) & := max_(bold(w)_C in cal(W)_C) EE_(bold(w)_(-C) ~ pi_(-C)) [Pr(overline(x) | C, bold(w)_C, bold(w)_(-C))] \
    M^*(C) & := M_+(C) + M_-(C)
  $

  where $bold(w)_C = (w_i | forall i in C)$ is the coalition's joint action and $pi_(-C)$ represents the distribution over non-coalition agents' actions.

  This measures the collective power of coordinating agents when they can synchronize their actions optimally.#footnote[This formulation has many similarities with Cooperative Game Theory.]
]

#theorem(name: "Combinatorial Complexity of Power Comparisons")[
  For $n$ controllers, each can be assigned to: (1) coalition $C_1$, (2) coalition $C_2$, or (3) marginalized. This yields $(3^n - 1)/(2)$ distinct power comparisons.

  *Proof:* Each controller has 3 assignments, giving $3^n$ total configurations. We subtract 1 degenerate case (all marginalized). The grand coalition (all in $C_1$ or all in $C_2$) is valid. Since $C_1$ vs $C_2$ comparisons are symmetric, we divide by 2. Note: $(3^n - 1)$ is always even since $3^n$ is odd for all $n$, ensuring integer results.

  *Example:* For $n = 3$ controllers: $(3^3 - 1)/(2) = 26/2 = 13$ comparisons, including grand coalition $A_1, A_2, A_3$.
]

== Environmental Power

// Mentioned that comparisons can only be made when referring to a similar scope, etc.

// I think it's also possible you can actually just model this as taking one of 2^n possible actions and comparing the control any two offer you or something.

#remark(name: "The Environment as Controller")[
  Can #glspl("environment") exert "#gls("power")"? While #glspl("environment") don't take deliberate actions, environmental states do influence #gls("agent") behavior (@reverse-environmental):
  #figure(
    caption: [Reverse environmental influence: Environment affects agent behavior through probabilistic states.],
  )[
    #align(center)[
      #diagram(
        node-stroke: .1em,
        node-fill: gradient.radial(blue.lighten(80%), blue.lighten(40%), center: (30%, 20%), radius: 80%),
        spacing: 4em,
        node((0, 0), [Env.], radius: 2em, fill: env-fill),
        edge([$W$], "-|>"),
        node((1, 0), [$B$], radius: 2em),
        edge([$x$], "-|>"),
        // edge((0, 0), (0, 0), `read()`, "--|>", bend: 130deg),
      )
    ]
  ] <reverse-environmental>

  *Example.* Weather "determines" whether others will attend your picnic -- rain reduces attendance probability.

  While this stretches our definition of #gls("power") depending on how you view the #gls("environment"), it may still be sensible to define the environment as a virtual agent where possible environmental states become the #gls("action-space").
]

#remark(name: "Modeling Agency as a Methodological Choice")[
  #Gls("dahlian-power") doesn't require desires or utility functions -- only the ability to select from multiple actions. This creates a philosophical tension:
  - Deterministic view: If #glspl("environment") (or #glspl("agent")) have no genuine choice, then $∣ cal(W) | = 1$, yielding zero #gls("dahlian-power")
  - Probabilistic view: We assign probabilities to environmental states due to our uncertainty, treating nature as if it "chooses" stochastically


  *Practical Resolution.* Whether discussing weather patterns or legislative decisions, we model both #glspl("agent") and #glspl("environment") probabilistically because:
  - Complete determinism is computationally intractable
  - Uncertainty is inherent to our observations
  - Probabilistic models yield useful predictions

  *Whether you model #gls("environment")/people as probabilistic behavior or an #gls("agent") is a methodological choice, not an ontological claim about free will or determinism.* We use whichever representation -- #gls("agent") or #gls("environment") -- best serves our analytical goals.
]

== Means-Response Chains and the Limits of Dahlian Power

#remark(name: "Means-Response Chains")[
  Consider a #gls("means-response-chain") where $A$ influences $B$, who influences $C$, and so on (@fig-means-response-chain):
  #figure(
    caption: [Means-response chain: Sequential influence propagation through intermediate agents.],
  )[
    #set text(size: 7pt)
    #diagram(
      node-stroke: .1em,
      node-fill: gradient.radial(blue.lighten(80%), blue.lighten(40%), center: (30%, 20%), radius: 80%),
      spacing: 4em,
      node((0, 0), [$A^((0))$], radius: 2em),
      edge([$W^((0))$], "-|>"),
      node((1, 0), [$A^((1))$], radius: 2em),
      edge([$W^((1))$], "-|>"),
      node((2, 0), [$...$], fill: none),
      edge([$W^((N-1))$], "-|>"),
      node((3, 0), [$A^((N))$], radius: 2em),
      edge([$x$], "-|>"),
    )
  ] <fig-means-response-chain>
]

#remark(name: "The Attribution Problem")[
  #Gls("dahlian-power") fundamentally cannot handle indirect influence chains. To see why, consider:
  - $A^((0))$ has #gls("dahlian-power") over $A^((1))$'s action $W^((1))$
  - $A^((1))$ has #gls("dahlian-power") over $A^((2))$'s action $W^((2))$
  - But what is $A^((0))$'s #gls("power") over $A^((2))$'s action? This could theoretically be determined, yet bears no real relationship to the metrics above. For example: If $A^((2))$ has complete ($M = 1$) #gls("power") over $x$, then what does any non-zero measure of #gls("power") over $x$ from $A^((0))$ or $A^((1))$ mean? #footnote[This issue has some semblance to the issue of committing a crime under duress in law.]
]

#proposition(name: "The Black-Box Abstraction Necessity")[
  To analyze $A^((0))$'s influence on the final outcome $x$, Dahl's framework forces us to collapse the entire intermediate chain into an environmental #gls("black-box-abstraction") -- ie: assuming that $A^((0))$ is a kind of "initial mover", the only one capable of independent action while the subsequent agents take actions dependent on $A^((0))$ (@blackbox-abstraction).

  #figure(
    caption: [Black-box abstraction: Intermediate chain collapsed into environmental probability function.],
  )[
    #align(center)[
      #diagram(
        node-stroke: .1em,
        node-fill: gradient.radial(blue.lighten(80%), blue.lighten(40%), center: (30%, 20%), radius: 80%),
        spacing: 4em,
        node((0, 0), [$A^((0))$], radius: 2em),
        edge([$W^((0))$], "-|>"),
        node((1, 0), [Environment], radius: 3em, fill: env-fill),
        edge([$x$], "-|>"),
      )
    ]
  ] <blackbox-abstraction>
]

#remark(name: "Information Loss")[
  This abstraction loses all structural information about:
  - How influence propagates through the network
  - Which intermediate #glspl("agent") have veto #gls("power")
  - Where bottlenecks or amplifications occur
  - How #gls("power") dissipates or concentrates along the chain
]

#remark(name: "Lukes' Critique Formalized")[
  While Lukes' full critique goes beyond just this issue, this limitation forms one of Lukes' criticisms of #gls("dahlian-power"). In studying legislative #gls("power"), Dahl focused on observable voting behavior, missing upstream influences (@lukes-critique).
  #figure(
    caption: [Lukes' critique: Upstream power influences that Dahlian analysis misses in legislative contexts.],
  )[
    #set text(size: 7pt)
    #diagram(
      node-stroke: .1em,
      node-fill: agent-fill,
      spacing: 4em,
      node((0, 0), [Society], radius: 2.5em),
      edge([Ideational\ Power], "-|>"),
      node((1, 0), [Powerful\ Actors], radius: 2.5em),
      edge([Bargaining\ Power], "-|>"),
      node((2, 0), [Legislators], radius: 2.5em),
      edge([Material\ Power], "-|>"),
      node((3, 0), [Env.], radius: 2.5em, fill: env-fill),
      edge([Policy\ Passes], "-|>"),
    )
  ] <lukes-critique>
]


#remark(name: "Power Types Missing from Dahl")[
  Lukes identified two types of #gls("power") Dahl's framework cannot capture:
  1. *Bargaining #Gls("power")*: Shaping which policies reach the legislative floor
  2. *Ideational #Gls("power")*: Determining which ideas are even consciously considered

  These operate through influence chains that #gls("dahlian-power") must either ignore or compress into an opaque probability function.
]

// Lukes criticizes Dahl and the pluralists for being too empirical, only examining the political power of observable direct decision making, whereas there are plenty of soft-power leading up to that direct decision making that play a part in both (a) Shaping the preferences of voting and policies brought to the table prior to receiving the policy (bargaining power) (b) A more cultural notion of which ideas are even consciously considered (ideational power)  #todo[check + understand better]
// #todo[Perhaps fun to dig up Dahl's New Haven data and demonstrate some type of this modeling.] This categorization is extremely helpful for analyzing power and it will be returned to. However, can demonstrate mathematically what Luke's criticism is -- ie: Doesn't really tell you who has the final say.

#proposition(name: "Multiple Controllers as Partial Solution")[
  We could remodel the chain as multiple simultaneous #glspl("controller") (@flattened-chain).

  #figure(
    caption: [Flattened chain representation: Sequential chain modeled as simultaneous multiple controllers.],
  )[
    #align(center)[
      #diagram(
        node-stroke: .1em,
        node-fill: gradient.radial(blue.lighten(80%), blue.lighten(40%), center: (30%, 20%), radius: 80%),
        spacing: 4em,
        node((0, 1), [$A^((n-1))$], radius: 2em),
        node((0, 0.5), [$dots.v$], fill: none, stroke: none),
        edge((0, 1), (1, 0.5), [$W^((n-1))$], "-|>"),
        node((0, 0), [$A^((1))$], radius: 2em),
        edge([$W^((1))$], "-|>"),
        node((1, 0.5), [Env.], radius: 2em, fill: env-fill),
        edge([x], "-|>"),
      )
    ]
  ] <flattened-chain>
  // TODO: Add the society/powerful actors/legislators effect in this same way.
]

#remark(name: "Limitations of Flattening")[
  This flattening assumes all #glspl("agent") directly influence the outcome, ignoring:
  - Hierarchical relationships (who influences whom)
  - Sequential dependencies (temporal ordering matters)
  - Conditional influences (#gls("power") activated only under certain conditions)

  The incapability to model these complex relationships is a serious limitation of the model. Lukes' complaint of Dahl's empirical approach is, in part, a complaint that Dahl's #gls("power") *lacks so much predictive #gls("power")* by this inability as to be nearly useless. Any serious model of #gls("power") must move beyond the limitations of this model.
]

#remark(name: "The Technical vs. Structural Distinction")[
  This limitation isn't fundamentally about computational complexity. Computer scientists have developed sophisticated inference algorithms for modeling intricate probabilistic relationships -- Bayesian networks, Markov networks, loopy belief propagation, and variational inference can handle arbitrary dependency structures within the environmental "#gls("black-box-abstraction")." See @bayesian-network for an illustration of how a bayes net, starting from each #gls("agent")'s influences on latent variables (which can be thought of as "chains-of-effect"), could model how a final response changes due to some action by a #gls("controller").



  #figure(
    caption: [Complex probabilistic structure: Bayesian network showing latent variables and dependencies hidden within Dahl's environmental abstraction.],
  )[
    #set text(size: 8pt)
    #set align(center)
    #diagram(
      node-corner-radius: 4pt,
      spacing: (2.5em, 1.5em),

      // External agents - organized in a single column (only 3 agents)
      node((0, 0), [$A^((0))$], radius: agent-radius, fill: agent-fill, name: <a0>),
      node((0, 1), [$A^((1))$], radius: agent-radius, fill: agent-fill, name: <a1>),
      node((0, 2), [$A^((2))$], radius: agent-radius, fill: agent-fill, name: <a2>),

      // Latent variables - left to right progression (low to high level)
      // Left side: Direct agent effects
      node((2.5, 0), [$Z_1$], radius: z-radius, fill: z-fill, name: <z1>),
      node((2.5, 1), [$Z_2$], radius: z-radius, fill: z-fill, name: <z2>),
      node((2.5, 2), [$Z_3$], radius: z-radius, fill: z-fill, name: <z3>),

      // Middle: Intermediate effects
      node((4, 0.5), [$Z_4$], radius: z-radius, fill: z-fill, name: <z4>),
      node((4, 1.5), [$Z_5$], radius: z-radius, fill: z-fill, name: <z5>),

      // Right side: Higher-level aggregate effects
      node((5.5, 1), [$Z_6$], radius: z-radius, fill: z-fill, name: <z6>),
      node((4, 2.5), [$Z_7$], radius: z-radius, fill: z-fill, name: <z7>),

      // Direct output from highest-level latent variable
      node((7, 1), [$x$], radius: 0.5em, fill: gray.lighten(80%), name: <output>),

      // Agent actions only to left-side latent variables
      edge(<a0>, <z1>, [$W^((0))$], "->", stroke: action-stroke),
      edge(<a0>, <z2>, [], "->", stroke: action-stroke),
      edge(<a1>, <z2>, [$W^((1))$], "->", stroke: action-stroke),
      edge(<a2>, <z3>, [$W^((2))$], "->", stroke: action-stroke),

      // Left-to-right progression of effects
      edge(<z1>, <z4>, [], "->", stroke: z-interaction-stroke),
      edge(<z2>, <z4>, [], "->", stroke: z-interaction-stroke),
      edge(<z2>, <z5>, [], "->", stroke: z-interaction-stroke),
      edge(<z3>, <z5>, [], "->", stroke: z-interaction-stroke),
      edge(<z4>, <z6>, [], "->", stroke: z-interaction-stroke),
      edge(<z5>, <z6>, [], "->", stroke: z-interaction-stroke),
      edge(<z7>, <z6>, [], "->", stroke: z-interaction-stroke),

      // Direct output from highest-level latent variable
      edge(<z6>, <output>, [], "-|>"),

      // Visual groupings with enclosures
      {
        let agent-tint(c) = (stroke: c, fill: rgb(..c.components().slice(0, 3), 8%), inset: 12pt)
        let env-tint(c) = (stroke: c, fill: rgb(..c.components().slice(0, 3), 5%), inset: 16pt)

        node(enclose: (<a0>, <a2>), ..agent-tint(blue.darken(20%)), name: <agents>)
        node(enclose: (<z1>, <z2>, <z3>, <z4>, <z5>, <z6>), ..env-tint(green.darken(20%)), name: <environment>)
      },
    )
  ] <bayesian-network>
]


#remark(name: "The Dual Role Problem")[
  The deeper issue is *structural*: #gls("dahlian-power")'s foundational assumption that root #glspl("agent") make decisions independently creates an irreconcilable tension with influence chains. In #glspl("means-response-chain"), intermediate #glspl("agent") are simultaneously:
  - *#Glspl("responder")* to upstream influence (requiring dependent decision-making)
  - *#Glspl("controller")* in their own right (requiring independent decision-making)

  This dual role cannot be coherently modeled within Dahl's framework without either:
  1. Abandoning the independence assumption (breaking the foundational logic)
  2. Collapsing the chain structure (losing predictive information)
]

// #comment[Also modeling causality seems pretty difficult.]




== Scope Selection and Limitations

#remark(name: "Scope Limitation")[
  #figure(
    caption: [Scope selection limitation: Dahlian Power cannot meaningfully compare power across different response variables.],
  )[
    #align(center)[
      #diagram(
        node-stroke: .1em,
        node-fill: agent-fill,
        spacing: 4em,
        node((0, 1), [$A^((n-1))$], radius: 2em),
        node((0, 0.5), [$dots.v$], fill: none, stroke: none),
        edge((0, 1), (1, 0.5), [$W^((n-1))$], "-|>"),
        node((0, 0), [$A^((1))$], radius: 2em),
        edge([$W^((1))$], "-|>"),
        node((1, 0.5), [Env.], radius: 2em, fill: env-fill),
        edge((1, 0.5), (2, 0.3), [x], "-|>"),
        edge((1, 0.5), (2, 0.7), [y], "-|>"),
        // edge((0, 0), (0, 0), `read()`, "--|>", bend: 130deg),
      )
    ]
  ] <scope-selection>
  // TODO: UDPATE, SHOULD BE TWO PEOPLE.


  As discussed in the original essay, #gls("dahlian-power") is limited by #gls("scope-limitation") -- ie: the response that you're trying to measure (@scope-selection). There is not a very sensible way of comparing the #gls("power") between some response $x$ and some response $y$.

  *Example.* From Dahl's original essay:
  #quote(attribution: "Dahl's Concept of Power 1957")[
    With an average probability approaching one, I can induce each of 10 students to come to class for an examination on a Friday afternoon when they would otherwise prefer to make off for New York or Northampton. With its existing resources and techniques, the New Haven Police Department can prevent about half the students who park along the streets near my office from staying beyond the legal time limit. Which of us has the more power?
  ]
]

#remark(name: "The Importance Dimension")[
  For a general theory of #gls("power"), it is extremely limiting to lack the ability to compare #gls("power") in two separate contexts. While the quote from above was meant to point out how comparing #gls("power") is difficult and perhaps arbitrary, there are situations for which there is a clear distinction between who has more #gls("power") in an intuitive sense.

  Imagine legislators have different #gls("dahlian-power") when voting on two distinct topics: (A) Whether a social welfare program will be approved and (B) Whether town hall's bike shed will be painted green or blue.

  Intuitively, if legislator Alice has considerably more #gls("dahlian-power") over (A) than legislator Bob, no matter what Bob's #gls("dahlian-power") over (B) is, we would still say that Alice has more #gls("power"). _Our intuitive sense of #gls("power") relies not only on the ability to influence outcomes, but also how much we care about those outcomes._ This will be revisited later, but for now will be left as a limitation of #gls("dahlian-power").
]

== General Modeling Difficulties

*Practical Modeling Challenges.* #Gls("dahlian-power") has some modeling difficulties that exist across many domains but are nonetheless worth mentioning:

#remark(name: "Action Space Selection Problem")[
  #gls("dahlian-power") doesn't explain why some actions are included or excluded from the #gls("action-space"), offsetting difficulties to the modeler. E.g. If a legislator can burn down the legislative building instead of voting, guaranteeing the policy doesn't get passed, does the legislator have lots of #gls("power")? In one sense (the #gls("dahlian-power") sense), they do, but in another sense they don't have more #gls("power") than they did before because the probability they make this decision is essentially $0$ -- it's up to the modeler to recognize this possibility and leave it out.

  Additionally, it's important to determine which actions are available. Partly from Lukes' response, covert bargaining happens before reaching the voting floor. These actions over time and ability to bargain need to be added to the action/strategy space (e.g. By defining tuples of actions indicating actions over time, $("bargain for", "vote for")$).
]

#remark(name: "Controller Selection Problem")[
  Partially from Lukes' response, it's important to consider every source of influence that influences the final variable. i.e. It's not just the legislators that determine whether a policy passes, they're also influenced by society, their family, and others to different degrees.
]
// TODO: Add temporal decision making to "the means" as a  strategy profile.
// The field of "Critical Theory" feels related

// == Complexity of Dahl and Need For Compact Representations

// In this formalism of power, for $N$ controlling player and a max of $M$ actions for each, there are $N dot M$ action profiles $w = (w_1, ..., w_n)$. Each of which interact through some mechanism modeled by $Pr$ to affect the response $x$.

// == Connecting Dahl to Game Theory

// What Dahl's theory of power does not say is HOW the players in this scenario determine their actions, keeping the probability function $Pr$ doing a lot of work here.

== Conclusion On Dahlian Power

*Summary.* #Gls("dahlian-power") provides a rigorous probabilistic foundation for analyzing influence relationships. At its core, Dahl's framework measures #gls("power") as the difference in probability: $M(A/B : W, x) := Pr(B, x | A, w) - Pr(B, x | A, overline(w))$. This captures the intuitive notion that A has #gls("power") over B when A can make B do something B wouldn't otherwise do.

*Requirements.* This newly generalized framework requires: (1) At least one #gls("controller") with defined #glspl("action-space"), (2) probabilistic relationships between means and responses, and (3) observable behavioral differences. Notably, #gls("dahlian-power") does *not* require utility functions, causal mechanisms, or rational decision-making -- only that #glspl("controller") (or environment) can choose between alternatives ($|cal(W_i)| > 1$).

*Utility.* #Gls("dahlian-power") proves most valuable in contexts with: simultaneous decision-making by multiple #glspl("controller"), well-defined response variables, and direct influence relationships. The framework works well with emperical data as Dahl originally used it -- ranking #glspl("agent") by their influence over specific outcomes through marginal, pairwise-conflict, and coalition #gls("power") measures.

*Fundamental Limitations.* Despite its elegance, #gls("dahlian-power") faces four critical constraints: (1) *#Gls("means-response-chain") incompatibility* -- indirect influence through intermediate #glspl("agent") cannot be coherently modeled without collapsing chains into environmental black boxes, losing structural information; (2) *#Gls("scope-limitation")* -- no mechanism exists for comparing #gls("power") across different response variables, preventing holistic #gls("power") assessment; (3) *Action space arbitrariness* -- the framework provides no guidance for determining which actions to include or exclude; (4) *Controller selection ambiguity* -- no systematic method for identifying all relevant sources of influence.

These limitations point toward the necessity of utility-based frameworks that can handle preference-weighted cross-domain comparisons and structured influence networks -- topics we explore in subsequent sections.

#pagebreak()
// = Why Actions are Necessary for Power Analysis

// == The Inseparability Thesis

// #claim[Power is meaningless without considering available actions -- these elements are fundamentally inseparable in any coherent power framework.]


// === Behavioral Power

// *Insight 1.* Power is a function of available actions.

// *Insight 2.* Power is a function of optimal actions assuming rationality.


// I might name this control.

// #todo[Finish.]

= Why #gls("absolute-power") Fails to Model #gls("power") Dynamics

#todo[Should this only be possible once utility is introduced?]

#todo[From cooperative game theory, we have weighted graphs, rule-based representations, and weighted-voting games.]

== The Modeling Asymmetry Thesis


#proposition[Models of relative power ($cal(R)$) form a proper superset of models of absolute power ($cal(A)$), establishing that $cal(R)$ is more expressive than $cal(A)$ in modeling capacity.]

_Dahl says that there must be a "connection" for there to be a power dynamic._

=== Formal Statement

#definition(name: "Power Model Spaces")[
  Let:
  - $cal(A) = {M :\ M "models power as properties of agents"}$
  - $cal(R) = {M :\ M "models power as relational"\ "properties between agents"}$

  Then: $cal(A) subset cal(R)$ (proper subset relation)
]

=== Supporting Arguments

==== Absolute Power as Special Case of Relative Power ($cal(A) subset.eq cal(R)$)

#theorem(name: "Reduction Principle")[
  Any absolute power model can be reformulated as a relative power model by introducing an environmental baseline.
]

*Formal Construction.* Given absolute power $P_"abs": "Agent" -> RR^+$, we can define:
$ P_"rel"(a, e) = P_"abs"(a) - P_"abs"(e) $
where $P_"abs"(e)$ serves as a zero-point reference for environment $e$.

#todo[Replace with an actual proof from graph theory]

*Physical Analogy.* This construction mirrors potential energy in physics, where absolute potential $V$ is meaningless without a reference frame:
$ V_"rel" = V_"abs" - V_"ground" $

*Incompleteness of Absolute Power Models ($cal(A) subset.neq cal(R)$).*

#theorem(name: "Limitation Theorem")[
  Absolute power models cannot capture essential relational dynamics without introducing factors outside their framework.
]

#todo[Demonstrate some examples like in my original, such as distance as one factor and just other seemingly complex set of environmental interaction factors that seem almost impossible to resolve absolute powers between entities to relative powers in a sensible way. In physics potential can be mapped to potential energy using distance, unlikely we have anything nearly as similar.]

*Core Problem.* The power relationship between agents $A$ and $B$ cannot be logically derived from their absolute powers alone. Power lacks transitivity -- if $A$ dominates $B$ and $B$ dominates $C$, this does not guarantee $A$ dominates $C$. This non-transitivity demonstrates that power cannot be reduced to a single absolute measure.

*Example.* Consider a circular dominance structure (like rock-paper-scissors):
- Rock defeats Scissors
- Scissors defeats Paper
- Paper defeats Rock

No absolute power assignment $P_"abs"$ can capture these relationships.

*Conclusion.* Since capturing these dynamics requires factors $in.not cal(A)$, we have $cal(A) != cal(R)$.

#todo[improve]

=== Proof of Proper Subset Relation

From §1.2.1: $cal(A) subset.eq cal(R)$\
From §1.2.2: $exists M in cal(R)$ such that $M in.not cal(A)$\
Therefore: $cal(A) subset cal(R)$ (proper subset) $square$

=== Power Over Environment as Logical Encapsulation of What is Meant By "Absolute Power"

#todo[fin]

=== Conclusion

Absolute power alone is insufficient for modeling power. For the remainder of this work, we consider only relational power -- power over the environment or power over other agents.

_Note: This does NOT tell us that relative power is sufficient, only that it may be._

#pagebreak()

= Why Utility is Necessary for Power Analysis

== The Inseparability Thesis

#proposition[Power is meaningless without considering agent utilities -- these elements are fundamentally inseparable in any coherent power framework.]

_NOTE: Will likely replace this utility statement._

=== Utility Alignment

*Core Insight.* Power is an incoherent concept under complete alignment of utilities.

#definition(name: "Utility Alignment")[
  Let:
  - $U_A, U_B : cal(S) -> RR$ be utility functions for agents $A$ and $B$
  - $cal(S)$ be the state space
  - $P(A -> B)$ be the power of $A$ over $B$

  If $U_A (s) prop U_B (s) space forall s in cal(S)$ (perfect alignment), then $P(A -> B)$ is behaviorally irrelevant.
]
// Note: Utility alignment is not enough for behavioral alignment, which we care about.

*Illustrative Example.* Consider a human-loving agent who can travel to an island, harm anywhere from 1 to 1,000,000 innocent people, and then escape unnoticed. Does their power increase with the number they _could_ harm? This capacity is irrelevant:
- The human-loving agent doesn't benefit from causing harm and would prefer not to
- The potential victims have no desire to be harmed

The mere existence of this action is meaningless without considering whether it would ever be exercised.

#todo[Replace with better example.]

#todo[Include behavioral misalignment, ie: power over]

=== Agent Boundary Definition

#theorem(name: "Aggregation Principle")[
  Alignment relationships determine when individual power can be meaningfully aggregated into a single coherent agent:
  $ [P_"collective" = sum_i P_i] <=> [U_i approx U_j space forall i, j] $
]

*Application.* Humanity's collective power is discussable precisely because humans share sufficient utility alignment over key domains.

*Connection to Sociology* This is akin to _power-within_ discussed in sociological literature.

=== Environmental Mediation

*Extended Framework.* When modeling multi-agent systems with environmental interactions:
- Environment $E$ can be treated as an agent with its own dynamics
- Even without direct conflict between agents, they may compete for environmental resources
- Agents may inflict harm indirectly through environmental manipulation

Power becomes relevant when agents compete for control over shared environmental factors, even if their ultimate goals don't directly conflict.

#todo[Also could say that their actions are some mixed strategy over a number of actions. Not sure if this is true but not a crucial point.]

=== Agents in Shared State Space

Agents of course, are themselves components of state spaces and they may have preferences over the state of themselves and others. Often times they have preferences for their survival which must be modeled in the utility function as well.

=== Critique of Light-Cone Formulation

*Orthogonality Scenario.* Consider alien civilization $Omega$ with utilities orthogonal to humanity $H$. Imagine $Omega$ cares only about arranging neutrinos into smiley faces -- an activity that has zero impact on human flourishing. Meanwhile, humans optimize matter and energy arrangements with no effect on neutrino patterns. (We can additionally imagine that neither agent meaningfully interferes with the other, perhaps humanity and these aliens never interact)

Even if $Omega$ achieves perfect control over neutrino arrangements while humans have only partial control over matter/energy, it's meaningless to compare their "power over the environment." The concept of environmental control is incoherent without specifying _which aspects_ of the environment matter.

*Key Insight.* Power must be defined over relevant state space -- control over factors that actually matter to the agents involved:
$ P_"relevant"(A) = integral_(cal(S)_A) |nabla U_A (s)| space d s $
where $cal(S)_A := {s in cal(S) : partial U_A \/ partial s != 0}$ represents the relevant state space.

Note that this relevant state space is inherently chosen in reference to some agent and thus is incoherent outside of some utility reference frame.

== Synthesis

#theorem(name: "Completeness Requirement")[
  A complete theory of power requires (although may be insufficient):
  + Relational framework ($cal(R) supset cal(A)$)
  + Behavioral specifications for all agents (possibly without explicit utilities)
  + Action space definitions $cal(A)_i$
  + Relevance constraints on state space $cal(S)_i subset cal(S)$
]

*Implication.* Power analysis without game-theoretic foundations is fundamentally incomplete. $square$

#todo[Power of signaling. US vs Japan and communicating the existence of the nuclear bomb. US in some way doesn't have power over Japan if it doesn't benefit from either (A) Annihilating it or (B) Communicating its Annihilation.]

#pagebreak()

// *Legal Responsibility Assessment.* The legal concept you're describing involves several related doctrines that courts use to determine criminal liability when someone commits an act under external pressure or coercion.

// *Duress Defense Framework.* The primary legal framework is the *duress* defense, which recognizes that individuals may not be fully culpable for criminal acts committed under sufficient threat or coercion. Courts apply an objective standard -- would a reasonable person of ordinary firmness have been unable to resist the coercion? Your examples illustrate this spectrum perfectly: a death threat would likely constitute sufficient duress for most crimes, while threatening to destroy a bobblehead would not meet the legal threshold.

// *Mens Rea Analysis.* Courts also examine *mens rea* (criminal intent) to determine whether the defendant possessed the requisite mental state for the crime. Coercion can negate the voluntary nature of criminal intent, though this varies by jurisdiction and specific circumstances. The degree of coercion directly impacts whether the defendant formed the necessary criminal intent.

// *Proportionality Assessment.* Legal systems typically require proportionality between the threatened harm and the criminal act. The threatened harm must be imminent, serious, and comparable to or greater than the harm caused by the criminal act. This explains why your death threat example would carry more legal weight than the bobblehead scenario.

// *Culpability Gradation.* Rather than a binary guilty/not guilty determination, many jurisdictions allow for graduated culpability -- recognizing that coercion may reduce rather than eliminate criminal responsibility. This might result in lesser charges, reduced sentences, or mitigation during sentencing rather than complete exoneration.
