# dimension-computation

Some code to compute the dimension of possible values of $\mathrm{Hom}_G(V, V)$ where $G$ is a finite group and $V$ is a finite dimensional representation. We can decompose $V$ into a sum

$$V = \bigoplus_i V_i$$

of irreducibles. Then we have that

$$\mathrm{Hom}_G(V, V) = \bigoplus_{i, j}\mathrm{Hom}_G(V_i, V_j).$$

Schur's lemma tells us that $\mathrm{Hom}_G(V, W)$ is $0$-dimensional if $V$ and $W$ are not isomorphic, and $1$-dimensional if they are. The question then becomes a purely combinatorial one, which this code computes.