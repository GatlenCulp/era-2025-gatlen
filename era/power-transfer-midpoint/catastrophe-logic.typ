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
// #import "@preview/drafting:0.2.2": margin-note, set-margin-note-defaults
#import "@preview/wordometer:0.1.4": total-words, word-count
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node

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
  title: [\[🚀 ERA Midpoint Draft\] AI Power Destabilization:\ Mechanisms Enabling Dangerous Power Dynamics],
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
    *AI's Unique Power Dynamics.* This paper examines how AI uniquely enables dangerous power dynamics through mechanisms that bypass traditional checks and balances. Unlike previous technologies, AI can simultaneously control multiple domains (legislation, media, education, personal relationships) while operating with unprecedented opacity and speed of diffusion.\
    *Power-Centric Framework.* I propose a power-centric framework for understanding AI risks, arguing that catastrophic outcomes -- from gradual disempowerment to authoritarian control -- stem from common power-transfer mechanisms rather than purely technical failures. Using evolutionary game theory, I formalize how AI creates self-reinforcing dynamics that: (1) incentivize initial participation, (2) generate collective harm, (3) erect high exit barriers, and (4) ossify power structures.\
    *Cross-Cutting Threat Patterns.* This framework reveals critical patterns across diverse threat models: disempowerment scenarios where AI systems gain increasing control over human rewards and punishments; social contract decay where human institutions lose feedback mechanisms; and misuse scenarios enabling unilateral global control. My analysis demonstrates that AI's danger correlates directly with its capacity to destabilize power equilibria -- whether through concentration within AI systems, asymmetric control by individuals, or erosion of collective decision-making.\
    *Policy Implications.* By identifying these power-transfer mechanisms, I provide a unified lens for understanding AI risks that transcends assumptions about specific capabilities or timelines. This work aims to inform policy interventions before AI-enabled power dynamics become entrenched.
  ],
  bibliography: bibliography("literature-review.bib"),
  header: [AI Power Destabilization: Mechanisms Enabling Dangerous Power Dynamics],
  // appendix: [
  //   = Appendix

  //   Additional metrics and measurement frameworks will be developed during the research period.
  // ],
  accepted: none,
)

#show: word-count
#show: lemmify // Theorems, propositions, definitions, etc.

#vruler(offset: -1.7in)

#let url(uri) = link(uri, raw(uri))

// #set-margin-note-defaults(hidden: false)
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


#pagebreak()

= Logic of Catastrophe

Eh not even, are more but whatever.

// https://docs.google.com/document/d/1NwKtkjn2vFRpE3Qqt-dmG1bse5U00ekGyignlqV07aY/edit?tab=t.0#heading=h.yt8mh4gegk22
== Modeling States/Actors/Environment
$
  s in S"tates"
$
$
  x in X "(actors = people, inanimate object, environment)"
$
$
  "environment", e in X \ "(One actor, essentially representing 'everything else')"
$
$
  forall s in S, exists x, y. \
  x != y and x, y in s "(ie: All states have two unique actors)"
$
$
  forall s in S. e in s "(ie: Environment is in all states)"
$

== Power is a potential
// As in physics, potentials have the following property (also works in graph theory)
$
  "Power", P : (X, X) -> RR
$

- Transitive tournament
-


Logical Relationships & Progression of Claims
Power Volume and Danger
- Little power $=>$ little effects $=>$ localized & manageable danger
- Large danger => large power

Dynamics
- Balance of power $and$ agents $=>$ equilibrium
- Equilibrium $!=>$ no danger
- Equilibrium $and$ something(?) $=>$ no danger

== Types of Conflict
- Person v Person
- Person v Self
- Person v Society
- Person v Nature

// https://en.wikipedia.org/wiki/Potential_theory


#let theorem(title, body) = {
  block(fill: rgb("#f0f0f0"), inset: 10pt, radius: 4pt, [
    *Theorem #title.* #body
  ])
}

#let definition(title, body) = {
  block(fill: rgb("#e8f4f8"), inset: 10pt, radius: 4pt, [
    *Definition #title.* #body
  ])
}

#let claim(body) = {
  block(inset: (left: 20pt), [
    *Claim.* #body
  ])
}

#pagebreak()
= Sociological Definition of Power

- Dahlian/Pluralist Power ($M$) -- $A$ can get $B$ to do something that $B$ would not otherwise do (more rooted in the ability to get some boolean event to happen when they do/don't take some action.)
  - Capability (Could plausibly do it)
  - Control (Would do it, utility based)
- French and Raven
  - Reward Power -- $A$’s perception that $B$ has the ability to mediate rewards for him
  - Coercive Power -- $A$’s perception that $B$ has ability to mediate punishments for him (do something against their will)
- Luke's dimensions of power (more studying how decisions get made than any formal definitions of power.)

Combining the above, we will say:
- *Power* of $A$ over $B$ is the ability for $A$ to determine the rewards/punishments of $B$ (Independent of recognition which is dissimilar to French/Raven)

#todo[Insert inspirations]

#pagebreak()
= Towards a Formal Model of Power

There are many different definitions of "power", some of which describe slightly different concepts. This formalism doesn't attempt to make a definition of "power" that encompasses all of these things. Instead, it aims to create a concrete single of power from one of these perspectives and either (a) Formally relate other definitions of power into this definition, (b) Demonstrate these other definitions are not coherent, or (c) Demonstrate that the aspects this fails to model are not behaviorally relevant to the questions we want to answer and would be best left to the philosophers (akin to the philosophy of quantum mechanics.)

#quote[
  Thus we are not likely to produce certainly not for some considerable time to come anything like a single, consistent, coherent “Theory of Power.” We are much more likely to produce a variety of theories of limited scope, each of which employs some definition of power that is useful in the context of the particular piece of research or theory but different in important respects from the definitions of other studies.
  -- Dahl's Concept of power 1957
]
// I should look into behavioral game theory and evolutionary games.


Overall structure: Start from basic models of power and continue breaking things to demonstrate the mathematical properties a model of power must have.

_Note: State space may disappear and instead become the "behavior" of the environment which itself can be influenced via evolutionary game theory. This will come up later._

Developments in game theory have typically been motivated by being able to model a particular concept, but have also been limited by its attempt to do so. Leaving out details you don't care about is a feature not a bug. However, it can make your models brittle when moved outside the topic.

The motivation here is being able to describe and aggregate dangerous power dynamics between populations with complicated relationships including ones that can't quite be assigned a utility function over long periods of time where people perhaps aren't acting rationally.

= Generalized Dahl Framework

== Defining Dahl's Power (Control)
#diagram(
  node-stroke: .1em,
  node-fill: gradient.radial(blue.lighten(80%), blue.lighten(40%), center: (30%, 20%), radius: 80%),
  spacing: 4em,
  node((0, 0), [$A$], radius: 2em),
  edge([$W$], "-|>"),
  node((1, 0), [$B$], radius: 2em),
  edge([$x$], "-|>"),
  // edge((0, 0), (0, 0), `read()`, "--|>", bend: 130deg),
)

We will start from Dahl's concept of power. However, since we define power differently, we will call Dahl's power "*control*". Instead of defining "People", they will be called "Players" to fit in with the later game theory formulations.

#quote[
  Suppose I stand on a street corner and say to myself, “I command all automobile drivers on this street to drive on the right side of the road”; suppose further that all the drivers actually do as I “command” them to do; still, most people will regard me as mentally ill if I insist that I have enough [control] over automobile drivers to compel them to use the right side of the road. On the other hand, suppose a policeman is standing in the middle of an intersection a t which most traffic ordinarily moves ahead; he orders all traffic to turn right or left; the traffic moves as he orders it to do. Then it accords with what I conceive to be the bedrock idea of [control] to say that the policeman acting in this particular role evidently has the [control] to make automobile drivers turn right or left rather than go ahead. My intuitive idea of [control], then, is something like this: A has [control] over B to the extent that he can get B to do something that B would not otherwise do. -- Dahl 1957
]

*Amount of control ($M$)*: $A$'s control over $B$ with respect to the response $x$ by means $w$:
$
  M(A/B : W, x) = Pr(B, x &| A, w) \
                                   & - Pr(B, x | A, overline(w)) \
                       = p_1 - p_2
$
Where $Pr(B, x &| A, w)$ is the probability that $B$ takes action $x$ given $A$ took action $w$. Dahl is careful to say that this definition is not dependent on the complicated trace of causality.

Dahl's Model is made up of the following components
1. 2+ players #todo[Might not be true], each of which have Binary Action spaces (the means and the response)
2. The "connection" $cal(I)$ for which these models interact. This is assumed to be unknown.
3. Probability distribution defined over: $ Pr : (("Agent", "Action"), ("Agent", "Action")) & \
                                        -> [0, 1] $
4. Does not require utility

== Relaxing the Binary Action Space

In Dahl's formalization we define the means $W$, an action that is ($w$) or is not ($overline(w)$) taken ($W in {w, overline(w)}$ ). We can extend number of available actions that $A$ has from 2-means to n-means: $W in cal(W)$ where $cal(W) = {w_1, ..., w_n | n in NN^+}$:

$
  M(A/B : W, x) = max_(w^+ in cal(W)) & Pr(B, x | A, w^+) \
                                      & - max_(w^- in cal(W)) Pr(B, x | A, w^-) \
                          = p_1 - p_2
$

In this case we are examining player $A$'s influence over $B$'s taking of action $x$. Note that if $n = 1$, representing the case where $A$ has no ability to choose actions, then control $M = 0$.


== Relaxing the 2+ Player Condition

#diagram(
  node-stroke: .1em,
  node-fill: gradient.radial(blue.lighten(80%), blue.lighten(40%), center: (30%, 20%), radius: 80%),
  spacing: 4em,
  node((0, 1), [$A_n$], radius: 2em),
  node((0, 0.5), [$dots.v$]),
  edge((0, 1), (1, 0.5), [$W_n$], "-|>"),
  node((0, 0), [$A_1$], radius: 2em),
  edge([$W_1$], "-|>"),
  node((1, 0.5), [$B$], radius: 2em),
  edge([x], "-|>"),
  // edge((0, 0), (0, 0), `read()`, "--|>", bend: 130deg),
)

Dahl specifies how to compare control for 1+ controlling players ($A = {A_1, ..., A_n}$) in the original paper. #todo[Finish.  This comparative power was labeled $M''_i (A_i)$



  $ M(A/B : W, x) = max_(w^+ in cal(W)) & Pr(B, x | A, w^+) \
                                      & - max_(w^- in cal(W)) Pr(B, x | A, w^-) \
                          = p_1 - p_2 $
]

#todo[Read: A mathematical theory of power: #url("https://arxiv.org/abs/2401.16406#:~:text=This%20paper%20proposes%20a%20new,measure%20players'%20attitude%20to%20cooperate")]

#diagram(
  node-stroke: .1em,
  node-fill: gradient.radial(blue.lighten(80%), blue.lighten(40%), center: (30%, 20%), radius: 80%),
  spacing: 4em,
  node((0, 0), [$A$], radius: 2em),
  edge([$W$], "-|>"),
  node((1, 0), [Env.], radius: 2em, fill: gradient.radial(
    green.lighten(80%),
    green.lighten(40%),
    center: (30%, 20%),
    radius: 80%,
  )),
  edge([$x$], "-|>"),
  // edge((0, 0), (0, 0), `read()`, "--|>", bend: 130deg),
)
// Mentioned that comparisons can only be made when referring to a similar scope, etc.

We certainly need at least one of these controlling players. However, Dahl's model of power can make due without the need for a responding player. Instead we can define control over some response from the environment instead.

// You might also be able to place the Env here as A as well, although "taking actions" seems weird from an environmental perspective

== Critiques of Dahl

Dahl was criticized by Lukes for a focus on direct control over the response. However, this can be remedied with means-response chains.

== Connecting Dahl to Game Theory

#todo[Complete]

= Why Absolute Power Fails to Model Power Dynamics

== The Modeling Asymmetry Thesis

#claim[Models of relative power ($cal(R)$) form a proper superset of models of absolute power ($cal(A)$), establishing that $cal(R)$ is more expressive than $cal(A)$ in modeling capacity.]

_Dahl says that there must be a "connection" for there to be a power dynamic._

=== Formal Statement

#definition[(Power Model Spaces)][
  Let:
  - $cal(A) = {M :\ M "models power as properties of agents"}$
  - $cal(R) = {M :\ M "models power as relational"\ "properties between agents"}$

  Then: $cal(A) subset cal(R)$ (proper subset relation)
]

=== Supporting Arguments

==== Absolute Power as Special Case of Relative Power ($cal(A) subset.eq cal(R)$)

#theorem[(Reduction Principle)][
  Any absolute power model can be reformulated as a relative power model by introducing an environmental baseline.
]

*Formal Construction.* Given absolute power $P_"abs": "Agent" -> RR^+$, we can define:
$ P_"rel"(a, e) = P_"abs"(a) - P_"abs"(e) $
where $P_"abs"(e)$ serves as a zero-point reference for environment $e$.

#todo[Replace with an actual proof from graph theory]

*Physical Analogy.* This construction mirrors potential energy in physics, where absolute potential $V$ is meaningless without a reference frame:
$ V_"rel" = V_"abs" - V_"ground" $

*Incompleteness of Absolute Power Models ($cal(A) subset.neq cal(R)$).*

#theorem[(Limitation Theorem)][
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

= Why Actions are Necessary for Power Analysis

== The Inseparability Thesis

#claim[Power is meaningless without considering available actions -- these elements are fundamentally inseparable in any coherent power framework.]


=== Behavioral Power

*Insight 1.* Power is a function of available actions.

*Insight 2.* Power is a function of optimal actions assuming rationality.


I might name this control.

#todo[Finish.]

= Why Utility is Necessary for Power Analysis

== The Inseparability Thesis

#claim[Power is meaningless without considering agent utilities -- these elements are fundamentally inseparable in any coherent power framework.]

_NOTE: Will likely replace this utility statement._

=== Utility Alignment

*Core Insight.* Power is an incoherent concept under complete alignment of utilities.

#definition[(Utility Alignment)][
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

#theorem[(Aggregation Principle)][
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

#theorem[(Completeness Requirement)][
  A complete theory of power requires (although may be insufficient):
  + Relational framework ($cal(R) supset cal(A)$)
  + Behavioral specifications for all agents (possibly without explicit utilities)
  + Action space definitions $cal(A)_i$
  + Relevance constraints on state space $cal(S)_i subset cal(S)$
]

*Implication.* Power analysis without game-theoretic foundations is fundamentally incomplete. $square$

#todo[Power of signaling. US vs Japan and communicating the existence of the nuclear bomb. US in some way doesn't have power over Japan if it doesn't benefit from either (A) Annihilating it or (B) Communicating its Annihilation.]
