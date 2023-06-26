### Component relationship
App -> Main -> Calculator -> CalculatorAdvancedOptions<br/>
..........|..............\`-> Something else<br/>
..........\`-> Something else -> so on
           
### Dependency
`CalculatorAdvancedOptions` has its own dependency struct `CalculatorAdvancedOptionsDependency`. Same for the rest of the components, each defines its own dependency.<br/>
This effectively means the compoents are saying I don't care what's going on out there, here are the things that I need, give me those and I'll do my job, don't give me more than what I need, please.<br/>
Because of this, the cascading dependency relation becomes very clear. Whoever call `CalculatorAdvancedOptions` has to gather and thoes dependencies (from its parent caller or create by itself) and pass it to `CalculatorAdvancedOptions`. The dependecies also only live as long as they are needed, once `CalculatorAdvancedOptions` is dismissed, its dependencies will be gone too if no one else is holding a reference to them. We can also inject different object of the same protocol to different component too. Current way we're doing is like singleton.

### Navigation
Just a proposal on how we can control navigation of `NavigationStack` from the outside of the view using `NavigationPath`

### Builder and Router
From what I've heared, currently we have the Module to take care of building a component and manage its navigation. That is nice to have a dedicated object to handle those things. S in SOLID :D<br/>
I separated them further in to a Builder and Module

### Other things
ViewModel (logic) is separated out from State (Observable). 
Module (navigation logic) is separated out from ViewContainer.
ViewModel and Module are exposed with protocols. Only the builder access the actual implementation to do its job: building and injecting stuff. This is to make it easier for testing and decouple objects.


