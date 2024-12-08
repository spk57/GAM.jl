# Examples
Worked examples using GAM.jl from Generalized Additive Models, Simon N. Wood

## Linear Models
```
using RDatasets
using GAM
using Plots
```
### Trees
```
df=dataset("datasets", "trees")
mod = gam("Volume ~ s(Girth, k=10, degree=3) + s(Height, k=10, degree=3)", df)
```

### Hubble
y ~ x  

```
hubble=dataset("gamair", "hubble")
hubMod =gam("y ~ x", hubble) 
hubMod1=gam("y ~ x", hubble[Not([3,15]), :])
scatter(hubble.x, hubble.y, label="Measured")
scatter!(hubMod.x, hubMod.Fitted, label="Fitted")
scatter(hubble.x, hubble.y, label="Measured")
scatter!(hubMod.x, hubMod.Fitted, label="Fitted")
GAM.summary(hubMod)
plot(fitted(hub.mod), residuals(hub.mod), xlab="fitted values", ylab="residuals")

```