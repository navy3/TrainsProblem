TrainsProblem
=============

ThoughtWorks written examination,trains problem.

*version 2.0*
now I have refactored my code,use simple factory and strategy pattern.

made code more object-oriented.

TPTrianFactory is a factory class,use this in viewcontrollers to invoke the corresponding algorithm.

TPTrainAlgorithm is a base class:init a map array,and a blank method.Inherit and override the method to implement more algorithm.

TPTrainParameter is a class used when you invoke algorithm.

TPHelper is a common class,implement some method commonly used,like char to string, char to int,and so on.


*version 1.0*
I program it on mac lion 10.7.4,based on xcode 4.3.2.ios > 5.0.

solved the trains problem use objective c.
you can build and run it on iOS Device and iOS simulator.

how to use it?
this application based on tabbarcontroller.has 4 tabs.

Tab 1 (Distance): solved questions from 1 to 5.
Description:Tap Button A,B,C... to create route.Tap "Result" Button to get the result.

Tab 2(Stops):solved questions from 6 to 7.
Description:
1,set the starting route and ending route by ABCDE button.
2,set number how many routes between two city.
3,use segmentControl set condition "<=" or "==".
4,Tap "Result" get the result,and result will display on the textview at th bottom.

Tap 3(Shortest):solved questions form 8 to 9.
Description:
1,set the route between two city. by ABCDE button.
2,Tap "Result" get the result,and result will display on the textview at th bottom.

Tap 4(Different):solved question 10.
Description:
1,set the route between two city. by ABCDE button.
2,set the distance between two city.
3,Tap "Result" get the result,and display it.