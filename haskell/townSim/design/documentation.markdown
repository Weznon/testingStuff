### What a town is made of
* People
    * Name
        * Used for distinguishing civilians
    * Age
        * Quality of Life, has no real effect besides determining kids
    * Stat Table
        * Used to calculate labour, defense value, etc
    * Statuses
        * Stat Modifiers
    * Inventory
        * Used to represent gear
* Buildings
    * Provide Various bonuses to the town, such as increased labour for certain  jobs
* Stockpiles
    * Stores inventory, can be set to only store certain items

### Process Simulation
* Starts by generating the day's event
    * Most of the time the event will be mundane, just outputting a string with no real effect on simulation
        * "King of the land the town is in makes a new law"
    * Sometimes it will effect production
        * "Plague, Production of farmers is reduced"
        * "Harvest Moon, Production of farmers is increased"
        * "Festival, Production of labourers is halted"
    * Other times it will be an attack
        * "Necromancer attacks town"
* Depending on the event, will switch to town defense mode, or labour mode
    * Labour Mode
        * Each civilian performs their labour. Completed objects are put into a temporary inventory, which is added to the stockpiles at the end of the day
        * After a completed object, another to be made is created for the labourer, based on supplies available. If nothing can be made it'll just add one magically
        * Guards and Military personnel do nothing
        * At the end of the day, after things are put into stockpiles, civilians look for upgrades
    * Defense Mode
        * Towns Defense total is calculated
            * Dependant on what buildings there are, guards stats/armor
            * If larger than attacking force, town immediately wins, no injuries
            * If same or less, town guards recieve one injury statues, and depending on difference, loses items or buildings get damaged
