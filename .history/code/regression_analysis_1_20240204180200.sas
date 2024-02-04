data Trans1;
    infile '/home/u48806641/Real Estate Data.csv' dlm="," firstobs=2; /* start from 2nd line */
    input x1 x2 x3 x4 x5 y;
    yt=1/(y);
    proc stepwise data = Trans1;
    model yt = x1 x2 x3 x4 x5/ sle = 0.5 sls = 0.5 stepwise; /* stepwise selection */
    proc rsquare cp mse sse adjrsquare;
    model yt = x1 x2 x3 x4 x5;
    run;
    proc plot data = Trans1;
    plot yt*(x1 x2 x3 x4);
    proc corr data = Trans1;
    proc reg data = Trans1 outvif
    outest = r ridge = 0 to 2 by 0.2;
    model yt = x1 x2 x3 x4/ p vif lackfit r influence;
    run;
    proc print data = r; /* print data */
    run;