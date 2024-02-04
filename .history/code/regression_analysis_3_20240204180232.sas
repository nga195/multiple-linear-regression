data Trans1O;
    infile '/home/u48806641/Real Estate Data Void Trans1.csv' dlm="," firstobs=2; /* start from 2nd line */
    input x1 x2 x3 x4 y;
    yt=1/(y);
    proc stepwise data = Trans1O;
    model yt = x1 x2 x3 x4/ sle = 0.5 sls = 0.5 stepwise; /* stepwise selection */
    proc rsquare cp mse sse adjrsquare;
    model yt = x1 x2 x3 x4;
    run;
    proc plot data = Trans1O;
    plot yt*(x1 x2 x3 x4);
    proc corr data = Trans1O;
    proc reg data = Trans1O;
    model yt = x1 x2 x3 x4/ p vif lackfit r influence;
    run;