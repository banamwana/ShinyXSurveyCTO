# ShinyXSurveyCTO
Read data from SurveyCTO directly into ShinyApp

This is a shiny app template extending the use of R's httr package for getting data directly from SurveyCTO found [here](https://support.surveycto.com/hc/en-us/articles/360036181094?input_string=r+shiny+webapp+direct+query)

It is important to designate a date for the query, otherwise SurveyCTO will block subsequent requests for a few hundred secs, which may cause problems for the app. 
