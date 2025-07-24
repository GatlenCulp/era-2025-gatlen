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
  header: [Towards Monitoring our Growing National Security Debt with AI],
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


#comment[Document Length: #total-words words]

#comment[
  Most of this paper will be re-written for the final draft. After pivoting my project position in the week before this deadline, I had to do some last-minute edits to rearrange and alter my draft for the old project. In source, I note a lot of comments of specific claims I make that need to be cited. These have been excluded for readability and thus some information may be inaccurate
]

= Introduction

== Background

*AI Expansion.* _AI_ -- a domain roughly defined by simulate human decision making -- is best viewed as a general purpose technology akin to steam, electricity, and information and communications technology (ICT)
#cite(<craftsArtificialIntelligenceGeneralpurpose2021>).
As such, its application is pervasive amongst almost all sectors of life from the military to the workplace to education to home entertainment. In recent years, there has been a boom in the domain of artificial intelligence, and in particular for Large Language Models (LLMs) -- a technology that boasts impressive capabilities in the domains of Software Engineering, Creative Writing, and more. Such developments have sparked a silicon-valley craze over the development of an Artificial General Intelligence (AGI) -- an AI matching or surpassing human capabilities across virtually all cognitive tasks #cite(<ArtificialGeneralIntelligence2025>). Across the US, discussions are being held over job displacement and international headlines were made when the Chinese company, DeepSeek released a model competing with state-of-the-art American LLMs. AI has lept onto the national agenda, with the White House releasing #link("https://bidenwhitehouse.archives.gov/briefing-room/presidential-actions/2024/10/24/memorandum-on-advancing-the-united-states-leadership-in-artificial-intelligence-harnessing-artificial-intelligence-to-fulfill-national-security-objectives-and-fostering-the-safety-security/")[a National Security Memorandum on AI in October 2024] and #link("https://www.whitehouse.gov/articles/2025/07/white-house-unveils-americas-ai-action-plan/")[a report titled "Winning the AI Race: America’s AI Action Plan" in July 2025].
// While there are great disagreements over the extent and timeframe AI changes society, there is little disagreement #comment[eh] over whether AI is a transformative general purpose technology on the order of the industrial revolution.
// #comment[
//   - introduce statistics on the diffusion of AI models, possibly from AI as Normal Technology
// ]

// AI represents a unique form of power transfer technology. Unlike previous general purpose technologies, AI directly substitutes for human judgment and decision-making authority across multiple domains simultaneously.

*Technology and Power Disruption.* Throughout history, transformative technologies have disrupted existing power structures. The agricultural revolution enabled the rise of permanent hierarchies and state control, while the industrial revolution concentrated wealth in factory owners and reshaped labor relations. More recently, information and communications technology created new forms of media control and platform monopolies. AI represents the next major technological disruption to power dynamics, but with unprecedented characteristics that make it uniquely dangerous.
// Historical precedent (Agricultural revolution, ICT revolution, smaller cases like pagers) (media monopolies, propaganda systems, financial system concentration, tech platform monopolies), Actor-Network Theory in Anthropology
#footnote[
  // In some ways, the risks AI elicits are not unique.
  // #comment[AI as Normal Technology does a pretty decent job discussing how pretty narrow AI wouldn't be a wildly new challenge, pull more info from here]
  // In particular, arms races to develop and adopt technology to gain an economic or political edge and developing regulations to internalize externalities is a textbook economics problem.
  Our cultural institutions and cognitive autonomy have targeted been posed by social media algorithms, mass media, internet, and personalized advertising especially over the past two decades, influencing not just public opinion but also legislation (such as car dependent infrastructure in the US
  // #comment[kind of old, not best example]
  ) and elections. Arguably, the global political polarization, hostility, and rise of conspiracy theories have been a result of how the internet has developed and the economic incentives of businesses embedded in algorithms -- which themselves have been shaped by small groups and other institutions, relatively unregulated.
  // #comment[This section feels weakly related to my overall point, relate better]
  . While these influences are hard to attribute and are scattered across many individual and organizational choices, singular top-down manipulation is also feasible. Following the acquisition of Twitter/X by Elon Musk, large changes were made to the platform and the content that gained popularity, which can be traced back to individual decisions
  // #comment[Cite. Or just remove, contentious in political environment].
  About (90%?) of the platform stayed, despite (55%?) being against the changes
  // #comment[cite]
  -- likely attributable to a kind of lock-in and a difficulty to migrate to other platforms (ex: creators have built their following on there, users accustomed to getting their news there, etc.). Regardless, this is just a single platform and while there are negative effects, they are far from catastrophic. However, the influence over culture should not be underrated -- the effects of media control have been widely studied, often with the perspective of state propaganda, a massive topic of the 20th century as it applies to the Soviet Union and Communist China, and the origin of the term brain washing
  //  #comment[okay now it feels like I'm being alarmist ooo 1984 spooky, kind of overused].
  Even today, technology has enabled China to influence minds using the Great Firewall, mass surveillance, and content/message censorship.
  // #comment[I don't necessarily want to call out China either]
  // Something something information economy. This demonstrates the power over our culture with explicit discussion. Talks about misalignment. Top down control. Something something people also think they free thinkers.
]

#todo[*Bad Power Dynamics and Catastrophe* Bad power dynamics are at the core catastrophes, fast and slow: War, oppressive governments, inequality, climate, etc.]

== Thesis

#todo[
  *Thesis.* AI risks stem from elusive power-transferring mechanisms creating dangerous dynamics. Demystifying power is key to demystifying risk.
  - Creates new vectors for influence that bypass traditional checks and balances
  - Existing AI threat models: Existing catastrophic AI risk scenarios from less to more sci-fi, rapid development etc.
  - Benefits of a power-centric view
]


*AI's Potential for Disruption.* Across the globe, AI is becoming increasingly embedded in our institutions -- our economy, culture, cognition, education, research & development, and government have the potential to be shaped. At the present, we see educators grappling with incorporating AI into the classroom and preventing cheating, software developers taking the day off if their AI-enabled tooling is offline, researchers and journalists raising alarm bells as to how AI could be used to manipulate elections, and growing evidence towards dead-internet theory. As capabilities grow and diffusion continues, the future could see collective forgetting as AI masters human skills, ceremonial democracy as automated governance exceeds human comprehension, emotional dependencies on AI systems, AI enabled military coups, and automated AI research and development excluding humans from developing the same technology powering the modern world. While AI can also enable authoritarian regimes
// #comment[cite]
and worsen existing societal issues
// #comment[cite]
, they can also create new vulnerabilities in liberal democracies
// #comment[maybe don't use these in a policy paper, jk but not really] #comment[At this point, I haven't made much of the connection between AI and this technology, but I kind of want to move on. Maybe this should be its own section]
.
// #comment[eh paragraph.]
// #comment[Better examples, more likely and consequential ones] #comment[also make these less negative]. #comment[maybe introduce timelines? idk how much work to do on background]

// *Integrated AI is a National Security Risk.* AI has the opportunity to improve corporate and government efficiency, develop new technologies, democratize education, and far more. With so many prospects, it is unsurprising that so many are keen to rapidly develop and implement this technology. And considering the power that comes with owning and exporting this technology, it's unsurprising that the United States has tried maintaining their grip on the technology and their lead over the China.
// However, the gradual integration of AI into our lives, institutions, and culture leaves humanity (and especially the nations first to embrace the technology) vulnerable to influence -- hard and soft. This paper aims to introduce the idea of a growing national security debt that the pressures to develop AI create and propose some ways of tracking its development.

== Goal of the Paper

#todo[
  Reveals assumptions in original threat models
  Reveal free-variables that could dramatically change the situations
  Reveal holes in threat models
  Remains logically consistent
  Explanatory and predictive power (do the conclusions of these threat models align with the modeling of power?)
  Formal framing of these scenarios
  We fail if: Can’t get coherent definitions, this doesn’t tell us anything more about the scenarios we are modeling.

  Economists engage w/ AI risk mitigation & mechanism design

  AIS community able to identify, analyze, and mitigate risks more effectively

  Government incorporates power analysis in their AI policies, preventing unforeseen power concentration
]

== Structure of the Paper

*Paper Structure* This paper argues that catastrophic AI outcomes -- from gradual disempowerment to authoritarian control -- stem from common power-transfer mechanisms rather than purely technical failures. AI creates self-reinforcing dynamics that: (1) incentivize initial participation, (2) generate collective harm, (3) erect high exit barriers, and (4) ossify power structures. By understanding these mechanisms, we can better identify, analyze, and mitigate AI risks before they become evolutionarily stable. This paper examines three core power-transfer mechanisms: _disempowerment scenarios_ where AI systems gain increasing control over human rewards and punishments; _social contract decay_ where human institutions lose feedback mechanisms; and _misuse scenarios_ enabling unilateral global control. Using a power-centric framework, I demonstrate that AI's danger correlates directly with its capacity to destabilize power equilibria.

#pagebreak()
= AI Uniquely Enables Dangerous Power Dynamics

// Why elusive?
// Developed/diffused faster than institutions, not-encountered before (wide AI autonomy, widely-diffused dangerous capabilities), info asymmetry, etc.
// Simultaneous Multi-Domain Control
// Single foundational model can influence legislation, media, education, and personal relationships
// Cross-domain consistency amplifies influence
// Network effects of unified AI systems
// Opacity and Unaccountability (info asymmetry, autonomy of models)
// Black box decision-making
// Plausible deniability of influence
// Difficulty in attributing manipulation
// Rapid, Quiet Diffusion
// Software not hardware - instant global distribution
// Low barriers to entry mask dependency creation
// Integration happens below threshold of collective awareness
// Centralized Development, Distributed Impact
// Handful of foundational models
// Billions in development costs create natural monopolies
// Winner-take-all dynamics in AI development
// Raw model power, etc.


#todo[Adjust this section to focus more on power dynamics and decision-making authority rather than general AI framing]
== AI and Power-Transfer Mechanisms



// Make comments on Human-Centered AI, AI that is intended to augment not replace humans -- not sufficient. Or feasible in some situations? And fails to frame this danger.
// "In summary, while AI will undoubtedly redefine many professional landscapes, human input remains invaluable. Technological advancements might have reduced the number of people needed for menial tasks, but they've also freed professionals to focus on more meaningful aspects of their jobs. Whether we call it "working from home" or "living at work," the key takeaway is that technology, including AI, is a tool, not a replacement for human expertise and decision-making."
// Frame this in a way that's not like "omg we should use this to conquer everything" to "holy shit please hold up, let me see this AI y'all are working on."
// System failure tends to happen immediately. Not be coordinated. AGI would actually be a massive security risk.
// Rare risks, ex: Texas flash floods.


// == Comparisons of Institutional AI Risk to Others


// #comment[Likewise...
//   - MILITARY -- Nuclear weapons / power (might be more apt) (much easier to develop/share, many other use cases, hard to control)
//     - We have competition with other countries to develop, it is kind of military but also kind of a general purpose technology.
//   - Information and communications technology
// ] #comment[Have to move on, a bit tired and running out of steam on this topic.]

// #comment[Other kinds of misalignment risks listed in gradual disempowerment.]

== AI is Uniquely Problematic.

While AI shares many similarities to other technologies, a few properties make AI a particularly destabilizing technology.
// (a) the massive cross-domain scale of diffusion, (b) rapid development and diffusion, (c) centralization of control, (d) non-detectable secret or misaligned loyalties,
// #comment[mouthful]
// (e) potential for dependence (and human lock-out / loss of control?)
// #comment[TODO: Create better differences, be more principled. Also elaborate. Also separate foundational models from other versions of AI]
// #comment[AI coup would say "singular loyalties"]

// #comment[Unlike financial debt (which elicits imagery of a credit card bill) or technical debt (which involves recognizing and not-implementing best practices), The ai-induced national security debt is more subtle and threatening in some key ways: (a) We don't know how much we owe (how costly is it to address?), (b) We don't know how to pay it (how to address it?), (c) We don't know what the consequences of not paying it are (how bad is the problem?). This paper attempts to address each of these. #comment[kind of vague, unnecessarily visual?]]

// *Potential for Dependence.*


=== Multi-Domain Control from Single Models
#todo[Add content about how single foundational models can influence legislation, media, education, and personal relationships simultaneously]

*Foundational Models as a Risk Amplifier.* The influence AI systems have expands greatly when we consider the increasingly general AI systems that we see today, primarily Large Language Models (LLMs) like ChatGPT which are built on top of *foundational models*, of which frontier models take upwards of \$100 million to train
#cite(<cottierHowMuchDoes2024>)
-- meaning the entire technology stack the modern AI revolutions depends on is enabled by just a handful of frontier models. While "AI" is confusingly used somewhat synonymously with these foundational models, it is important to distinguish between AI using foundational models and AI not using foundational models as most of the societal vulnerability introduced by AI is attributable to these models in particular, a topic explained later in "AI is Uniquely Problematic".
// #comment[I don't distinguish these throughout this paper (oops), especially in the example below. I should maybe fix this.].
Critically, it's also this technology that not only amplifies national security vulnerabilities, but also makes them exploitable.

=== Opacity and Unaccountability
#todo[Add content about black box decision-making, plausible deniability, difficulty in attributing manipulation]

"The nature of neural networks used in AI makes understanding how AI comes to its conclusion highly challenging. I recently read a 19 page research article that figured out how a single word was predicted."

=== Rapid, Quiet Diffusion

*Rapid Development.* There have been rapid improvements in the capabilities of foundational models without any fundamental insights into the nature of intelligence. Beyond the invention of the transformer and the Large Language Model, a considerable amount of improvements from GPT-2, a 2019 model barely able to string coherent sentences together, to 2025 models like o3, capable of automating tasks that would take software engineers over an hour and a half to complete, compose full essays, and achieve impressive scores on math benchmarks
// #comment[eh, not best examples]
, arise mostly from scaling existing practices and implementing intelligent but relatively mundane tricks, with incremental 1% improvements leading to exponential growth. A METR study indicates that the length of software engineering tasks foundational models can do is doubling every 7 months #cite(<kwaMeasuringAIAbility2025>), which may lead to a future where AI automates or augments its own research and development, creating feedback loops boosting progress faster than is currently humanly capable.
// #comment[Also recent SWE uplift study by METR #cite(<MeasuringImpactEarly20252025>) showing that AI enabled tooling actually makes developers slower. Also idk if worth mentioning intelligence explosion or "country of geniuses in a data center" Amodei. But even the PERCEPTION of it being helpful (even if harmful/incapable) is enough for it to diffuse. Diffusion is the right question here and development only helps so much in that it enables diffusion.]
There is trillions of dollars in investment going towards the development of this technology and lots of international attention.
// #comment[find source]

Of course there are reasons for doubt -- _benchmarks don't necessarily track the actual economic tasks_ we are interested in and while capabilities have seemed to rocket ahead, adoption of this technology has been quick, but not proportional. #cite(<AINormalTechnology>) Nonetheless, it's reasonable to believe that adoption could lag behind capabilities as many institutions are slow to integrate even decades old technology from the start of the information age.
While progress may eventually plateau, for the moment foundational models linger near human-level performance in many domains and it appears there is no slowing of cheap tricks that even junior researchers can pull to make improvements indicate that there may be enough low hanging fruit to sustain progress beyond human capabilities in most domains.

The speed of foundational model development has outstripped that of the industrial revolutions or nuclear energy, akin to developing the ENIAC computer in 1945 and having the internet and iPad by 1946 or the catapult in 399 BC and nuclear weapons by 398 BC. This rapid development severely hampers our cultural and political ability to reflect upon and steer the usage and development of this technology.
// #comment[Alarmist?]

// #comment[
//   "The real problem of humanity is the following: We have Paleolithic emotions, medieval institutions and godlike technology. And it is terrifically dangerous, and it is now approaching a point of crisis overall."
//   ― Edward O. Wilson
// ]

*Quiet & Rapid Diffusion.* Unlike the previous industrial and information revolutions, distribution of this technology doesn't require building large supply chains or factories to _scale the availability of models to meet global demand_
// #comment[sus]
. While running these models are computationally expensive compared to typical software applications, datacenters and GPUs remain mainly bottlenecks for the development and not the diffusion of foundational models. Once trained, foundational models can be run relatively cheaply, with less-powerful models able to be run on high-end consumer cards costing less than \$2000 USD. Most of the infrastructure for global distribution is already here, and estimations for how fast we can meet any additional demands are on the order of a few years.
// #comment[cite]

Unlike many other general purpose technologies, foundational models are _software not hardware_
// #comment[something here but not framed right]
, capable of being accessed from any computer. While it was mentioned above there is hardware involved in building out the supply of these models, these logistics are isolated from consumers and businesses working with these models. Whereas updating your business for the information age might have meant purchasing an expensive desktop computer and ripping holes in the wall to make way for ethernet cables and phone lines, the barrier to entry foundational models is extremely low and inexpensive since their operations take place elsewhere and are interacted with over the internet. Frontier foundational models can be accessed through chatbot interfaces over the internet in a matter of seconds, completely free of charge for low-quality models and as low as \$20/month for state-of-the-art. Individuals and firms don't need large up-front investments to start or stop using these models.

// Don't think this will be very impactful, however I think it will be a helpful stepping stone.

These foundational models also _require little expertise_ to use. By the nature of these models being designed as a drop-in solutions for most tasks, without any kind of tweaking, one requires little expertise in using these effectively. In five minutes, anyone could be taught to use a model like ChatGPT to operating their computer to producing photorealistic videos, policy proposals, homework assignments, websites, and more. As interfaces grow more useable and the models powering these interfaces become more capable, even less effort will be required in getting AI to automate or augment one's thinking, workflow, education, or entertainment. In the information age, computers were powerful but they required dramatic changes in one's workflow, learning new skills and ways of doing things that were more effective. Developing additional applications for computers often required years of experience and a big paycheck -- or consulting with another team of experts to get it built. Foundational models, on the other hand, offer the _ability to augment or automate existing workflows with little effort_ (in addition to offering more effective ones).

For similar reasons, adoption _doesn't require collective buy-in or network effects_. In the information and communication age, it was necessarily the case that multiple had to agree on protocols of communication -- sending emails or sharing online documents were useless unless everyone else you were working with agreed. Social media would not have been possible if not for the collective cultural decision to adopt not only the technology but the specific platforms using them, relying on network effects (and when individuals move on, these technologies die out -- think MySpace for social media or how floppy disks are practically non-existent). The growth of social media as a technology was handicapped by this barrier -- the idea of it existing as early as the 1960s, becoming technologically/economically feasible in 1990s, but arguably only coming into existence in the late 2000s
// #comment[cite]
. Because AI has the ability to augment or automate existing processes, it's diffusion not limited by slower moving cultural or institutional norms and the risk-averse tendencies that tend to accompany this oversight. It's this property that allowed our congressional staffer to automate their workflow without any prerequisite alterations to their working environment. This allows small groups and individuals to integrate AI at a local level without the approval of others this effects
// -- building the internet's backbone and protocols is an ongoing project over the course of decades. Web and video protocols have been subjects of scrutiny in the realm of computer science.
// #comment[I think I'm talking about the information age too much, feel like broken record.]
// #comment[I realize I might be overusing the big technical words because I want people to take me seriously. Might be beneficial to use more creative writing.]

These factors together -- massive supply, low barrier to access, low barrier to usage, and the ability to integrate AI in a local and isolated way -- all result in the _ability for foundational models to be diffuse not just rapidly but also without notice or oversight_. Especially in domains where automating workflow becomes taboo, individuals avoid admitting they use it and to what extent. In the workplace or government, it may go undiscussed, only in shared in hushed tones and that get quieter as management nears. It's for this reason that bottom-up integration and influence becomes possible described previously. A majority of the US government could be automated with foundational models before elected officials even recognize the possibility. Dead Internet Theory suggests that much of today's internet, particularly social media, is dominated by non-human activity and AI-generated content. AI might not just be used to flood the internet with entertainment, but also be used in the automation of influential content promoting values and perspectives -- the misuse of AI's in spreading misinformation is being widely discussed, but what about less malicious influence? Ie: Well-intentioned journalists, influencers, bloggers, educational content creators, fact checkers, etc. Journalists in key media institutions including Wired (and the New York Times) report to using foundational models as a key component of their writing and research.
// #comment[cite / talk to friend]
We should find it concerning that we don't know to what extent foundational models are involved in the automation or augmentation of these roles nor the rhetorical steering this might have over our media and information environment. If it were true that 90% of the information we receive on a day-to-day basis were produced and/or influenced by foundational models, would we know? And could we do anything about it?
// Dead internet theory: https://arxiv.org/abs/2502.00007

It's also the reason why, top-down oversight and control over our institutions becomes so difficult. Rules against unapproved usage would be a good start (ex: foundational models must not be used on work at this level of security clearance unless the models have also been), but might drive these activities further under-the-radar. Detecting AI augmentation and automation from human-produced work may be difficult, especially if widespread, since the body of human-generated work and sentiments to compare against diminishes. However, this might require distinguishing acceptable from unacceptable usage, and detecting not just when augmentation occurs but when it crosses an agreed upon line -- not just across one task, but every task, implicit and explicit in the worker's job expectations.
// #comment[At an extreme level, maybe involves monitoring their AI involvement outside of the workplace, if a matter of national security.]
// #comment[Perhaps move to policy recommendations section.]


=== Centralized Development, Distributed Impact
#todo[Add content about handful of foundational models, billions in development costs creating natural monopolies, winner-take-all dynamics]

#pagebreak()
= A Power-Centric Model of Risk

// #todo[Add content about power volume correlating with danger level, bad power dynamics ⇔ danger, benefits of this view]
== Power's Relation to Risk

#todo[
  1. Power Volume and Danger
    1. Little power \=\> little effects \=\> localized & manageable danger
    2. Large danger \=\> large power
  2. Dynamics
    1. Balance of power & agents \=\> equilibrium
    2. Equilibrium (not \=\>) no danger
    3. Equilibrium & something(?) \=\> no danger
    4. …
]

// Progression of claims:
//   1. Trivial: Bad power dynamics *increase probability of* danger
//   2. Weak: Bad power dynamics *\=\>* Danger
//   3. Strong: Bad Power Dynamics ⇔ Danger
//   4. *Power-Dependent Risks Theory? (I’m awful at naming)*

// 4. Red teaming each of these claims with counter examples
//   1. How does nature play a role here?
//   2. Non-agentic objects and power

== Benefits of a Power-Centric View
#todo[Add content about better threat model interactions, principled understanding, policy appeal]
//   1. Better at dealing with interactions between threat models. For example, two threat models neutralize one another if there is a healthy balance of power. (Provide examples, like social contract or military.) Or if two catastrophes are co-occurring (ex: Gradual Disempowerment in a world Approaching AGI.)
//   2. Better at getting a principled and abstract understanding of threats.
//   3. Allows you to predict threats from power dynamics instead of reverse-engineering what to look for from the threat model
//   4. Potentially deals with the interaction of AI capabilities and societal factors well. (ex: Societal factors not predestined by overwhelming capabilities)
//   5. Possibly easier to pass policy on due to anti-power-concentration sentiments in democratic states.

#pagebreak()
= Formalizing a Power-Centric Model

== Importance of Formal Roots
#todo[
  Importance of formal roots
  Enables communication – Terms mean different things to different people. Some terms may be (a) reducible to others (b) nonsensical © inconsistently used, etc.
  Simulations of Complexity
  Mechanism Design
  …
  This paper will use these formalisms, but stop short of developing comprehensive games. (maybe better to call these analogues to EGT rather than claiming a formal basis then and receiving academic wrath as a consequence)
  The benefit of formal models like PAT or GT is rarely the math, instead it’s concepts (ex: When people say X is a “prisoner’s dilemma” they’re not actually writing down some strategic-form game and analyzing it, instead they’re tapping into a more principled and abstract understanding of frequently occurring scenario.)

]
== Explaining Evolutionary Game Theory
#todo[Learning about EGT]

== Appropriateness
#todo[Explain why I am not commiting academic fraud]

== Technical Utility
#todo[
  1. 🧑‍🧑‍🧒‍🧒 Overlapping populations \> individuals (unlike PAT)
    1. Able to model huge groups with heterogenous behaviors like “factory workers”
    2. Able to model inter-population dynamics where the separation is fuzzy ex: factory workers are also consumers.
    3. Handles complexity nicely, easier to combine two EGT models without having to redefine populations or their relationship. Better at handling the interplay of threat models like GD while ASI is being developed (cite). (might be wrong here)
  2. 🎲 Little strategic assumptions (unlike PAT)
    1. Don’t need utility functions to explain the behavior of AI
    2. Doesn’t assume people act rationally
  3. 📊 Little Room for Interpretation (unlike ANT)
    1. Make assumptions very clear
  4. 📈 Predictive mathematical dynamics (unlike ANT)
    1. Works worth other mathematical objects like graphs
    2. Predictive – Can be falsified and thus improved (“If your model explains all outcomes equally, it’s useless”)
    3. Handles complexity well (if humans can’t picture the result, can possibly run a simulation, although the variables can be really finicky)
  5. Formal definitions of stability (ESS) and other nice properties
  6. Existing literature, software, figure generation, etc.
  7. Downsides
    1. Perhaps too complex to get a principled grasp
    2. Requires too much effort to model
    3. Might not be
    4. (I understand CGT but not EGT yet, likely others)
]

== Definitions

#todo[
  Power — Ability to determine the rewards or punishments from player A to player B (potentially include info asymmetry) (some emergent property of multi-agent decision making) (Kind of like newtonian vs lagrangian vs hamiltonian equivalent formulations, but can be wildly more elegant)

  Power ossification — Evolutionarily Stable Strategy, no population can be invaded by a mutant strategy

  Misalignment — When populations A doesn’t take action benefitting population B AND population B doesn’t have the power to change population A’s action to something that does
  Others

  power-transfer mechanism, state-of-power, kinetic vs potential power

  What is “borrowed power” — Power you only have due to influencing the actions of another player.

  What is “Absolute power” vs “Relative power” — Could be seen as “power over environment” similar to electrical potential (physics terminology might be beneficial? Or not! Could be another model to say is bad.)

  Might not require utility functions for behaviors to arise (ie: Good framework for AI model behaviors for those not willing to attribute agency to AI)

]

== Evolutionary Game Theory Framework
#todo[Add content about modeling populations, minimal assumptions, predictive capabilities]

#pagebreak()
= Power-Centric Analysis of AI Threat Models
#comment[This entire section will be changed once I have some formalisms. My commentary from the previous project framing were transferred here for later reuse.]

#todo[Add content introducing three power-transfer types and key dynamics]

== Intro
#todo[
  Three types of power-transfer mechanisms and why they were chosen (perhaps choose a “control”, ie: some scenario where power is not dangerous like AI as normal tech.) (also maybe just drop these, analyze threat models directly? Seems perhaps better. Like just getting a formal understanding of gradual disempowerment from this lens would be WONDERFUL.)
]

#todo[
  For each of these types…
  1. Disempowerment-Esque – Increasing AI/Provider control over principal rewards/punishments
    2. Decay of Social Contract Esque – Decreasing displaced agent control over principal rewards/punishments
    3. Misuse-esque – Increasing unilateral control over global punishments

  …conduct analysis.
  1. Scenario variables where this power-dynamic shift occurs
  2. Examples of this type, how this exists globally
  3. Dynamics (examples)
    1. *Entry incentives* \- Good reasons to participate initially
    2. *Collective harm* \- Aggregate outcome is bad for everyone
    3. *Self-reinforcement* \- The more people participate, the harder it becomes to escape
    4. They explain *ossification* (why power concentrates permanently)
      1. *Exit barriers* \- High costs to stop participating once started
      2. Ex: Looking how fast a state can become a rentier state after discovering oil.
  4. *Speed* at which we can react to each of them
    1. They happen too fast for the speed of our institutions (people don't realize they're in one until too late)
    2. Boiling frog effects (happen too slowly for people to notice or take action, something something present bias)
]
== Disempowerment: Increasing AI Control
// #todo[Add analysis of scenarios where AI systems gain increasing control over human rewards and punishments]
#figure(
  image("figs/mechanism-01.png"),
  caption: [
  ],
  placement: top,
) <mechanism-01>

Broad, AI has the opportunity to influence and effect the systems and individuals that they come into contact with, precisely because they were designed to simulate, augment, and/or substitute human decision making. And as such, ceding (implicitly or explicitly) our decision-making capacity on the microscopic level aggregates to ceding our national capacity for steering our institutions, culture, and way-of-life to automated systems on a macroscopic level. In the process, locking ourselves out of the decision-making processes for a number of reasons -- competitive factors limiting oversight that would slow down development, inability to intervene on complexity over automated systems, interconnected automation for which small changes can lead to large collapses, technical debt that is too expensive or overwhelming to address, the cognitive decay/forgetting, illusions of control, cultural disinterest, etc.
// #comment[This sounds convincing but vague. Concrete examples would be very helpful.]

=== Power-Transfer Case Study: Congressional Staffer

#comment[This case-study analysis completed prior to pivoting my project. Used Claude to greatly repurpose my original to fit the current framing on power-dynamics. This is is being included for the midpoint submission, but will be entirely different or non-existent in the final paper.]

*Gradual Authority Transfer.* Consider a congressional staffer who gradually incorporates AI into their operations -- first for literature reviews, then email management, then policy drafts, press releases, and eventually value judgments. This represents a classic power-transfer mechanism where decision-making authority incrementally shifts from human to AI system. Initially, the staffer retains final authority over all decisions, using AI merely as a tool. However, under time pressures and competitive dynamics, delegation creep occurs -- the AI's framing of situations, perspectives, and sources become increasingly influential, while the staffer's independent analytical capabilities atrophy.

// #comment[Reframe this section to focus on power concentration and democratic authority rather than just "biases" - emphasize how power shifts from distributed human decision-making to centralized AI systems]
*Power Concentration Through Automation.* This scenario demonstrates how power gradually concentrates in AI systems through millions of micro-delegations. Each task transferred to AI represents a small reduction in human decision-making authority, but these accumulate into significant power shifts. The AI's consistent framing across all interactions creates a unified influence vector that no individual human voice can match. When this pattern replicates across governmental institutions, democratic decision-making authority becomes increasingly concentrated in the foundational models powering these systems, rather than distributed among elected representatives and their staff.

// #comment[Reframe this away from specific nationality concerns toward general power concentration risks]
// *Reasons why AI influence could be costly.* To give reason for concern here, foundational models have demonstrated preferences towards those of Chinese nationality, valuing them at x times someone of American nationality and y times someone of Z nationality, #cite(<durmusMeasuringRepresentationSubjective2024>) #comment[cite + confirm] potentially leading to policy decisions favoring one ethnicity over another or conducting negotiations with a prejudice against Americans #comment[Maybe want to pull back on the "lets paint AI red-white-and-blue and feed it apple pie" implications, there's something here that is of concern to policy makers but I am not framing it right]. Additionally, when foundational models were used to simulate various geopolitical actors in military simulations, they consistently opted for more unpredictable and escalatory behavior than their human counterparts, hinting that a government influenced by AI might be one inclined to violence and war #cite(<murphyGeneratingWargames2025>) #comment[cite Dennis' thing + confirm/substitute. Might be more anecdotal than empirical.].

// #comment[Adjust this to focus on power dynamics and collective action problems rather than "national security debt" terminology]
*Collective Action Problems Drive Power Transfer.* This scenario illustrates how rational individual decisions create collective power-transfer outcomes that no one intended. The _staffer_ sought productivity gains, inadvertently creating dependency on AI decision-making. Her _colleagues_ faced competitive pressures to adopt similar automation or risk being outperformed. _Management_ benefited from increased output while remaining unaware of the underlying decision-making authority transfer. The broader _institution_ experienced pressure to maintain competitive advantage, making reversal of AI integration politically and economically costly. This represents a classic collective action problem where individual rationality produces collective irrationality -- in this case, the unintended concentration of democratic decision-making power in AI systems.

// #comment[Adjust this to focus on systemic power-transfer patterns across domains rather than just "influence"]
*Systemic Power-Transfer Patterns.* This power-transfer dynamic replicates across multiple domains through similar mechanisms. In education, students become dependent on AI for cognitive tasks, transferring learning authority from human educators to automated systems. In media, content creators face competitive pressure to use AI generation, gradually transferring editorial authority to algorithms. In business, entrepreneurs delegate strategic decisions to AI systems to maintain market competitiveness. Each domain experiences the same pattern: individual adoption driven by competitive advantage, followed by collective dependency, resulting in the concentration of decision-making power in AI systems rather than human institutions.

// #comment[Reframe this to emphasize multi-domain power concentration rather than national security framing]
*Multi-Domain Power Concentration.* Foundational models enable unprecedented concentration of decision-making authority across traditionally separate domains. A single AI system can simultaneously influence legislation, personal relationships, diplomatic communications, bureaucratic processes, and scientific research. This cross-domain consistency amplifies the power-transfer effect -- whereas historical power concentration typically occurred within specific domains (military, economic, or media), AI enables unified control across all major sources of social coordination. This represents a qualitatively different kind of power concentration risk than previous technologies.

== Social Contract Decay: Decreasing Human Control
#todo[Add analysis of scenarios where human institutions lose feedback mechanisms]

#figure(
  image("figs/mechanism-02.png"),
  caption: [
  ],
  placement: top,
) <mechanism-02>



*Gradual Disempowerment.* In the paper on Gradual Disempowerment #cite(<kulveitGradualDisempowermentSystemic2025>), which formed the basis of the paper you are currently reading, the authors describe how incremental AI diffusion across economic, cultural, and state institutions can result in them becoming untethered from the human dependence and feedback that kept these institutions in-line with human welfare throughout history. One possible outcome of this gradual disempowerment being the formation of a fully self-sufficient non-human economy, leading to an _extinction by industrial dehumanization_ from pollution, armed-conflict and/or resource depletion #cite(<critchMyMotivationTheory2024>). While this paper does not go as far as to claim this is our future, this example nonetheless highlights just how severe the consequences of automation can be. There is a strong need to monitor AI's level of integration and influence even at the intermediate states between today's world and the one just described.
// The executive summary is so good, low-key want to include

*Automating Menial Labor.* AI is often praised for its capacity to automate repetitive or menial labor such as truck driving or factory jobs, allowing these workers to move on to more fulfilling roles
// #comment[Wording feels classist here(?)]
While there are a number of physical safety and cybersecurity concerns here -- incidents may be rare, relatively small, isolated and local, closely monitored, and more easily attributed to bugs or human error. In short -- risks are transparent and manageable.
// #comment[Cite. Explain what I mean here. Also maybe people worry about terminator or robot armies or something -- maybe worth addressing even if just to dismiss.]
Overall, automating menial labor neither seems to detract much from our civilizational capacity to decide our future nor does it introduce significant danger to national security.
// #comment[Is this distinction necessary? Do others agree it's not hugely important.]
This is largely in-line with the tool-view of AI,
#footnote[The view of tools as neutral instruments that depend on the user is flawed in a number of ways. (a) Tools influence the ways humans think and act, AI is no different (ex: Maslow's Hammer -- when you have a hammer, everything looks like a nail, phones, social media, etc.), (b) While claims like "this tool is bad" are ambiguous, tools can nonetheless be recognized for their ability to steer the future in one direction or another, (c) AI need not be conscious to display human-like characteristics or skills such as creativity.
  // #comment[is this worth mentioning]
]
which sees AI as a blank slate which mirrors the user's intent and loses its power once the user releases. However, this perspective dangerously underestimates both AI's potential for influence of its own and ability to accomplish tasks once believed to require "a human touch"
// #comment[Describe better or exclude].
#footnote[
  // The fact this point is dogged relentlessly, yet frequently forgotten, points to just how the pervasive idea of tool-influence separation and human exceptionalism is. #comment[Prob better way to explain this? Also human exceptionalism might have religious or transhumanist undertones.]
]
The influence of AI systems expands as we develop and apply them to accomplish ever more important, complex, and open-ended tasks.
// Something something religious human exceptionalism, God's chosen, etc.
// Also something something Life 3.0 diagrams.
// "future in which machines do all the work in a sustainable and humane way while humans relax and pursue the arts and philosophy"

// #comment[Reframe this as a clear example of power-transfer mechanisms in action - show how power gradually shifts from human to AI system]


== Misuse: Unilateral Global Control
#todo[Add analysis of scenarios enabling unilateral global control]

#figure(
  image("figs/mechanism-03.png"),
  caption: [
  ],
  placement: top,
) <mechanism-03>


== Key Dynamics Across All Mechanisms
#todo[Add content about entry incentives, collective harm, self-reinforcement, exit barriers]

= Conclusion

= Further Work

#pagebreak()

= Appendix

== Alternative Perspectives to EGT
#todo[Explain relative downsides/upsides of: ANT, PAT, Sociological Theories of Power (French and Raven, Cube of Power, etc..), Opinion transfer]

// 1.  **Disempowerment-esque \<\> Decay of Social Contract-Esque Comparison** – Maybe put these together, answer the question of “what happens when GD happens alongside ASI development”. Maybe my power-transfer mechanisms A, B, C but where A \+ B \= C.
//    2. **Possible Goals**
//       * **Immediate Priorities (Claude generated)**
//         * Map current AI power structures and dependencies
//         * Document case studies of AI-enabled power concentration
//         * Build stakeholder coalition
//         * Develop policy proposals
//       * **Medium-term Goals**
//         * International coordination on concentration limits
//         * Technical standards for AI diversity
//         * Institutional resilience frameworks
//         * Democratic AI governance models
//       * **Long-term Vision**
//         * Prevent AI oligarchy
//         * Maintain human agency and democratic control
//         * Ensure competitive AI ecosystem
//         * Build robust institutions against AI capture


== ATTACHED: Cursory Analysis of LLMs in the US Gov (July 2025)
#comment[This was an instrumental analysis for my main project. The larger question I was trying to answer was "how much influence could LLMs have from their deployment in the government," which is important from a number of threat models including treacherous turns (ex: AI-2027), AI-enabled coups, and long-term subtle influences misaligned with national interests. This analysis looked the sub-question of "How is the US government using models, to what extent, how might this evolve, and what processes can prevent wide-scale adoption of widely available LLMs." The original Google Doc can be found #link("https://docs.google.com/document/d/1FlZh69ppUUkXNKWOz9bcocPGRo77H0oU7N1klWrclqM/edit?usp=sharing")[here] and was posted online #link("https://www.lesswrong.com/posts/Lojk2pMJhHrmANag3/cursory-analysis-of-llms-in-the-us-gov-july-2025")[here].]



// #link("https://docs.google.com/document/d/1o37EfCjvbtZIgufJQpLdhfIA2Ig-E6PTvleYYENtHag/edit?tab=t.0")[AI Deployment in Key Institutions Cross-Analysis]

// #link("https://docs.google.com/presentation/d/1ikilDLpaIlueCwLxikK21sQj-TJdwwsGbwatKxqXVOc/edit?slide=id.g370fdf06599_0_83#slide=id.g370fdf06599_0_83")[Midpoint Presentation]

#link("https://docs.google.com/document/d/1EFgcZyiU7ZY8NYnOL8Tvo7Ljb2zcb5UPI9ASYBIcF-c/edit?tab=t.0")[Instructions]

#link("https://airtable.com/appYL8bmzJXAUgYeP/pagQtjvvhFcfy9o23/form")[Submission Link]


#pagebreak()
