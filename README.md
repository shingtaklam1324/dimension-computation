# dimension-computation

Some code to compute the dimension of possible values of $\mathrm{Hom}_G(V, V)$ where $G$ is a finite group and $V$ is a finite dimensional representation. We can decompose $V$ into a sum $V = \bigoplus_i V_i$ of irreducibles. Then we have that $\mathrm{Hom}\_G(V, V) = \bigoplus\_{i, j}\mathrm{Hom}\_G(V_i, V_j).$

Schur's lemma tells us that $\mathrm{Hom}_G(V, W)$ is $0$-dimensional if $V$ and $W$ are not isomorphic, and $1$-dimensional if they are. The question then becomes a purely combinatorial one, which this code computes.

As a question in representation theory, the dimension can be computed as an inner product $\langle \chi_V, \chi_V \rangle$ of characters. What this code does is compute the possible values of the dimension, rather than for any specific representation/character.

The total number is [A006171](https://oeis.org/A006171) and the dimensions that appear (without multiplicity) are [A215905](https://oeis.org/A215905).