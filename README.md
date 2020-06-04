# Flow CPU measurement bug demoe

## Setup
Create a default scratch org
Push source to the org
Assign the permission set to the default user using:

sfdx force:user:permset:assign -n Flowcpu_set

Open the developer console. 
Set logging levels to Apex: Error, Workflow: Finer, Profile: Info - all others to lowest possible level.

## Test 1

Deactivate the flow (SetFieldOnCreate)

In the developer console anonymous Apex window enter

AnonymousHelper.CreateRecords();

Capture the debug log - Not note the reported elapsed time. This is the baseline time (accuracy improves by averaging multiple attempts).

See file test1log.txt for an example

## Test 2 
Activate the flow (SetFieldOnCreate)

In the developer console anonymous Apex window enter

AnonymousHelper.CreateRecords();

Examine the debug log.

You will see that while the total CPU time used has grown considerably, it is not reflected in the FLOW_INTERVIEW_FINISHED_LIMIT_USAGE CPU time listing.

See file test2log.txt for an example

## Test 3

Now you may be thinking - the CPU time is because of the logging of flow operations...

So try again, this time changing the debug log level for workflow to None.

As you will see, the time does drop considerably, but is larger than test 1. This is the actual time used by the flow.

See file test3log.txt for an example

## The problem

It's not just that the FLOW_INTERVIEW_FINISHED_LIMIT_USAGE CPU time isn't showing the CPU time used by the flow. It's that anyone looking at the log (test3log.txt) would, because the flow CPU time is inaccurate, attribute the CPU time usage to the trigger - which is completley misleading.


