# Purpose
first interface to create events. When a user first logs in, we ask them to identify themselves. Then they can create some events. Once that is done, they can discover peers and share information with them. Each of these options are in a menu

# Design
A graph structure that can be visited by the agent. Each _menu_ has _options_ , a _prompt_ and a _handler_. The visitor have access to the full structure. Imagine you having a map in a amusement park. You know where to go from one attraction to the other by simply looking at your map. The visitor can do the same with its map. Each menu, i.e. a node in the menu graph. 

## Menu
Each menu must have a unique name. We will query the graph my the menu's name.

### Handler
The handler can use the result of the selected menu option to perform an action. This 
action may redirect the user to an other menu, prompt agent for some data, perform a side effect or simply kill the program.