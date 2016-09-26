from graphics import *
def main():
    window = GraphWin("Drawing", 500, 500)
    xBut = Rectangle(Point(0, 0), Point(50, 50))
    xBut.draw(window)
    xBut.setFill("red")
    while True:
        point = window.getMouse()
        x = point.getX()
        y = point.getY()
        if x < 50 and y < 50:
            break
        Point(x, y).draw(window)
    window.close()

main()
