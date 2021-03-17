# EctoGenErrorReproduce.Umbrella

## Steps to reproduce
1. Setup project (`mix deps.get && mix.deps.compile`)
2. Start the project using `iex -S mix`
3. The error should appear at the end of project compilation

### The error
> You have configured application :ecto_gen in your configuration file,
> but the application is not available.
> 
> This usually means one of:
> 
>   1. You have not added the application as a dependency in a mix.exs file.
> 
>   2. You are configuring an application that does not really exist.
> 
> Please ensure :ecto_gen exists or remove the configuration.
