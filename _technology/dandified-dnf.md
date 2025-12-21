---
version: "1.0"
series: "Technology"
kind:
sort_index: 20
nav_title: "Dandify DNF"
tags:
  - linux
  - fedora
  - dnf
  - cli
  - ux
  - ergonomics
  - package-management

title: "Let’s Dandify DNF"
description: |
  If DNF can install packages, it can uninstall them. The
  constraint isn’t technical—it’s habit.
deck: |
  Why ergonomics matter more than habit
---

Linux doesn’t need uniformity across every tool — init systems, editors, and
package formats can differ wildly without harm. Different approaches and
philosophies are part of its strength.

But **within a single tool**, there’s no excuse for inconsistent, asymmetric
command design — especially when that tool sits at the center of the user
experience.

This is where DNF stands out — and not in a good way.

---

## The Problem: DNF Doesn’t Follow Its Own Logic

DNF uses:

```bash
dnf install package
dnf remove package
```

From a human standpoint, this is incoherent. Natural language acquisition, prior
CLI conventions, and basic symmetry heuristics all train users to expect paired
verbs like install/uninstall. If you can *install* something, you should be able
to *uninstall* it.

The current naming isn’t principled — it’s inherited.\
`remove` comes from YUM. Before that, RPM used `erase`.

But here’s the part that matters:

**DNF is just a frontend.**\
It can name its subcommands anything it wants.

Technically, DNF could do this tomorrow:

```bash
dnf install package
dnf uninstall package
```

Or, if it felt like it:

```bash
dnf donkey package
dnf carrot package
```

Under the hood, it would still call `rpm -i` and `rpm -e`.\
Nothing would break. Nothing fundamental would change.

There is **no technical constraint** forcing asymmetric verbs here — short of
historical inertia, documentation debt, or ecosystem habit.

This is inertia. Nothing more.

---

## DNF 6 Already Broke Things — Just Not the Right Ones

DNF 6 introduced breaking changes across:

- plugin behavior
- CLI flags
- yum compatibility
- output formatting
- configuration semantics

So let’s not pretend backward compatibility is sacred.

What *wasn’t* touched?

The most visible, most teachable, most frequently used part of the interface:\
**the verbs users type every day**.

Not because fixing them is risky.\
Not because it’s impossible.

But because it would disrupt habits formed decades ago.

This leads to a tradeoff no one likes to say out loud:

> **Old users complain once.**  \
> **New users stumble forever.** &#x20;

If Fedora wants to grow its user base, modernizing the CLI matters more than
preserving fossilized vocabulary.

---

## Ergonomics Isn’t Cosmetic — It’s Strategic

People stick with tools that feel intuitive. They recommend tools that behave
consistently. Package managers are the **front door** to a distribution — they
define how the system *feels*.

This is why:

- Ubuntu exploded in popularity
- Arch built a loyal following
- Nix keeps gaining momentum
- Rust’s tooling is almost universally praised

Not because ergonomics was the *only* factor—but because it was a decisive,
compounding one that shaped first impressions, learning curves, and long-term
trust.

Not because of ideology, but because of **ergonomics**.

Every asymmetric verb, every legacy term defended “because history,” every
papercut compounds into long-term friction.

That friction becomes reputation.

---

## The Cost to Fix This Is Small. The Cost to Ignore It Is Long-Term.

Changing:

```bash
dnf remove
```

to:

```bash
dnf uninstall
```

—or simply adding `uninstall` as an alias—

would cost:

- a small documentation update
- a handful of scripts patched
- maybe one release cycle of grumbling

And then it’s done.

Not doing it means:

- new users repeatedly hit the same confusion
- RPM-based systems retain a “less intuitive” reputation
- potential lifelong users quietly drift to friendlier ecosystems

Ergonomics is how communities grow.

---

## Consistency Isn’t Hand-Holding — It’s Respect

This isn’t about dumbing anything down. It’s about respecting the mental model
every human brings to the terminal.

If a tool uses a verb, it should use its natural counterpart.

Consistency makes tools easier to learn, easier to teach, and easier to keep.

And sometimes the improvement a system needs is just one missing syllable:

```bash
dnf uninstall
```

That’s what it means to *dandify* DNF:\
small, deliberate choices that make the whole system cleaner, sharper, and more
humane.
