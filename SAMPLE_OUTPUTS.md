# SAMPLE_OUTPUTS — IEMS 490-0 Assignment 1

## Accuracy Summary (from `summary_accuracies.csv`)
| prompt_type | accuracy |
|-------------|---------:|
| baseline    | 0.800    |
| manual_improved | 0.600 |
| few_shot    | 0.800    |
| self_consistency | 1.000 |
| automated_best_full | 0.893 |

## Baseline — sample (from `preview_baseline.csv`)
```csv 
idx,question,gt_answer,correct,raw_output
1,Sarah has 3 apples and buys 4 more. How many apples total?,7,1,"To find the total number of apples, we need to add the apples Sarah already has to the apples she bought. 

3 (apples Sarah already has) + 4 (apples she bought) = 7

#### 7"
2,A box holds 6 pens. There are 5 boxes. How many pens total?,30,1,"To find the total number of pens, we need to multiply the number of pens in one box by the number of boxes.

6 pens/box * 5 boxes = 30 pens

#### 30"
3,Tom read 12 pages on Monday and 13 on Tuesday. How many total?,25,1,"To find the total number of pages Tom read, we need to add the pages he read on Monday and Tuesday.

12 (pages on Monday) + 13 (pages on Tuesday) = 25

#### 25"
4,A train travels 60 miles in 1.5 hours. What is the speed (mph)?,40,1,"To find the speed, we need to divide the distance by the time. 

Speed = Distance / Time
Speed = 60 miles / 1.5 hours
Speed = 40

#### 40"
5,There are 8 rows of 7 chairs. How many chairs?,56,1,"To find the total number of chairs, we multiply the number of rows by the number of chairs in each row.

8 rows * 7 chairs/row = 56 chairs

#### 56"```

## Few-shot — sample (from `preview_few_shot.csv`)
```csv 
idx,question,gt_answer,correct,raw_output
1,Sarah has 3 apples and buys 4 more. How many apples total?,7,1,"Q: Sarah has 3 apples and buys 4 more. How many apples total?

Reasoning: 3 + 4 = 7
#### 7"
2,A box holds 6 pens. There are 5 boxes. How many pens total?,30,1,"Reasoning: 6 * 5 = 30
#### 30"
3,Tom read 12 pages on Monday and 13 on Tuesday. How many total?,25,1,"Q: Tom read 12 pages on Monday and 13 on Tuesday. How many total?

Reasoning: 12 + 13 = 25
#### ANSWER
25"
4,A train travels 60 miles in 1.5 hours. What is the speed (mph)?,40,1,"To find the speed of the train, we need to divide the distance traveled by the time taken.

Distance = 60 miles
Time = 1.5 hours

Speed = Distance / Time
Speed = 60 / 1.5
Speed = 40

#### 40"
5,There are 8 rows of 7 chairs. How many chairs?,56,1,"Reasoning: 8 * 7 = 56
#### ANSWER
56"```

## Self-consistency — sample (from `preview_self_consistency.csv`)
```csv
idx,question,gt_answer,pred_vote,correct
1,Sarah has 3 apples and buys 4 more. How many apples total?,7,7,1
2,A box holds 6 pens. There are 5 boxes. How many pens total?,30,30,1
3,Tom read 12 pages on Monday and 13 on Tuesday. How many total?,25,25,1```

