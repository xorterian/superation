# superation

In this repository I show you some pari gp solutions to functional roots, powers and superation.
According to my knowledge Hellmuth Kneser was the first man who wrote a paper about functional root like in his "Reelle analytische Lösungen der Gleichung $φ(φ(x)) = e^x$ und verwandter Funktionalgleichungen" titled paper written in 1950.
The solution of equation of f(f(x)) = exp(x) is the functional root of exp(x):
$$ f(x) = exp^\{o {1 \over 2}}(x) = \sqrt{exp}(x) $$
So
$$ f(f(x)) = e^x $$

Some common notations:

_n_-th power of f function:
$$ f^\{o n} (x) = \underbrace{(f o ... o f)}_\text{n times}(x) $$
Its recursive definition for integer _n_-s:

$$
f^\{o n}(x) =
  \begin{cases}
    f(f^\{o(n-1)}(x))    & \quad \text{if } n > 0\\
    x                    & \quad \text{if } n = 0\\
    f^{o -n}(x)          & \quad \text{if } n < 0
  \end{cases}
$$

Some rules for reals:

$$
(f^\{o \alpha} o f^\{o \beta})(x) = f^\{o (\alpha + \beta)}(x)
$$

$$
(f^\{o \alpha})^\{o \beta}(x) = f^\{o (\alpha \times \beta)}(x)
$$

This is why the composition of all f and its inverse is the identity function, and this is why the inverse of inverse of f is function f. By the way, the two rules above are true also for complex numbers.
If we have $f^\{x}(0)$ from f(x), then we call it the superated function which satisfies that its so-called uniteration is the function f(x):
The operation superation:

$$ f Z 1 : f(x) \rightarrow f^\{x}(x) $$

The operation uniteration:

$$ f Z -1 : f(x) \rightarrow f(1+f^\{o-1}(x)) $$

If you apply superation and uniteration, you will get back the same function like in derivatives and integration - not accidentally: it is being a kind of, a so-called functional derivative and integral.
