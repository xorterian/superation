# superation

In this repository I show you some pari gp solutions to functional roots, powers and superation.
According to my knowledge Hellmuth Kneser was the first man who wrote a paper about functional root like in his "Reelle analytische Lösungen der Gleichung $φ(φ(x)) = e^x$ und verwandter Funktionalgleichungen" titled paper written in 1950.
The solution of equation of f(f(x)) = exp(x) is the functional root of exp(x):
$$ f(x) = exp^\{\circ {1 \over 2}}(x) = \sqrt{exp}(x) $$
So
$$ f(f(x)) = e^x $$

## Some common notations

_n_-th power of f function:
$$ f^\{\circ n} (x) = \underbrace{(f \circ ... \circ f)}_\text{n times}(x) $$
Its recursive definition for integer _n_-s:

$$
f^\{\circ n}(x) =
  \begin{cases}
    f(f^\{\circ (n-1)}(x))    & \quad \text{if } n > 0\\
    x                    & \quad \text{if } n = 0\\
    f^{\circ -n}(x)          & \quad \text{if } n < 0
  \end{cases}
$$

### Some rules for reals

$$
(f^\{\circ \alpha} \circ f^\{\circ \beta})(x) = f^\{\circ (\alpha + \beta)}(x)
$$

$$
(f^\{\circ \alpha})^\{\circ \beta}(x) = f^\{\circ (\alpha \times \beta)}(x)
$$

This is why the composition of all f and its inverse is the identity function, and this is why the inverse of inverse of f is function f. By the way, the two rules above are true also for complex numbers.
If we have $f^\{\circ x}(0)$ from f(x), then we call it the superated function which satisfies that its so-called uniteration is the function f(x):
The operation superation:

$$ f \Phi 1 : f(x) \rightarrow f^\{\circ x}(0) $$

The operation uniteration:

$$ f \Phi -1 : f(x) \rightarrow f(1+f^\{\circ -1}(x)) $$

The superator operator is generally a mapping $ \Phi : (\mathbb{R} \rightarrow \mathbb{R}, \mathbb{R}) \rightarrow (\mathbb{R} \rightarrow \mathbb{R}) $ where the mappings $ \mathbb{R} \rightarrow \mathbb{R} $ are just simply functions from reals to reals.
If you apply superation and uniteration on the same function, you will get back the same function like in derivatives and integration - not accidentally: it is being a kind of, a so-called functional derivative and integral.
Since $ a^b = exp(b \times log(a)) $, it is similar in functional power:
$$ f^{\circ \alpha}(x) = \circ exp( \alpha \times \circ log( f(x) ) ) $$
where
$$ \circ exp( f(x) ) = \lim\limits_{h \to \infty} \( x + {f(x) \over h} \)^{\circ h} $$
and
$$ \circ log( f(x) ) = \lim\limits_{h \to \infty} h \times ( \sqrt[\circ h]{f(x)} - x) $$

## Example

Let's superate the function y(x) = 2x.

$$ (2x \Phi 1)(x') = (2x)^{\circ x'} = \circ exp( x' \times \circ log( 2x ) ) $$

$$ \circ log( 2x ) = \lim\limits_{h \to \infty} h \times ( \sqrt[\circ h]{2x} - x) = \lim\limits_{h \to \infty} h \times ( \sqrt[h]{2} x - x) = \lim\limits_{h \to \infty} x \times h \times ( \sqrt[h]{2} - 1) = x \times log(2) $$

Because the _n_-th functional power of $ a \times x $ is $ a^n \times x $, furthermore its _n_-th functional root is $ \sqrt[n]{a} \times x $.
Thus

$$ (2x \Phi 1)(x') = \circ exp( x' \times x \times log(2) ) = \lim\limits_{h \to \infty} ( x + {{x' \times x \times log(2)} \over {h}} )^{\circ h} = $$

$$ = \lim\limits_{h \to \infty} ( x \times ( 1 + {{x' \times log(2)} \over {h}} ) )^{\circ h} = x \times \lim\limits_{h \to \infty} ( 1 + {{x' \times log(2)} \over {h}} )^h =$$

$$ = x \times e^{x' \times log(2)} = x \times 2^{x'} $$

So the superation of 2x is $ (2x \Phi 1)(x) = 2^x $ as we expected.

## Numerical approximation with Pari/gp

The exp.gp programme is based on Carleman matrices instead of functional limits. We can make the Carleman matrix of any function for which coefficients of its Taylor series converge:

$$ M[f(x)]_{j k} =  $$
