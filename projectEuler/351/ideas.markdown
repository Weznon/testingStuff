### Ideas
* You only need to calculate one out of the 6 sections of the hexagon, you can then multiply by six
    * You might even be able to split into 12th(down the middle of a 6th)
* Maybe make new coordinate system?
    * 3-D coords
    * Something that can easily calculate slope,
* Have a list of visibles or hiddens, see which is more effecient
* Make a formula for the number of points in a sector
* [[Visible]]
    * One for each row
    * From each one, calculate slope between all visibles and center
    * From that, see which points are hidden
    * Add new list of visible things to [[Visible]]
### GOT IT

Use the totient function, since if the slope is non simplifiable, then it isn't blocked by anything.
So find the sum of the totient of the number
