# Coderstats

http://coderstats.geeksta.net/

## Example Queries

Number of not forked repos of specified user
db.repos.find({user_id:ObjectId("4f4a3a70b744de2fd90000ff"), fork:false}).count()

Get all users with number of owned repos
db.repos.group({ key: {"user_id": true}, initial: {sum: 0}, reduce: function(doc, prev) {if (doc.fork===false) prev.sum += 1} })

db.users.find({}, {gh_login:1, updated_at:1}).sort({updated_at:1}).limit(10)

## TODOs/Ideas
* Use D3 for graphs
* Compare Coders
* Submit to G+ communities
* Create dedicated Sinatra::Base app for badges and load only what is needed
* Move controller logic from github.rb to helpers.rb
* languagegraph
    * add title and description
    * link from nav menu
    * generate graphs for each main user languages
* in app.rb check whether user was created and only then call update_stats when there are no users left updated before 2012-03-05
* Programming language network based on user langauges and repo count
* Add favicon to avoid 404s
    * "GET /coder/images/favicon.ico HTTP/1.0" 404
* Make achievements, summary, tables, charts embeddable indicated by plus sign on top right of surrounding boxes, let users set title and light or dark styles.
* Terms of service based on http://en.wordpress.com/tos/
* Fix Github oauth login, put auth data into auth collection, see:
    * https://github.com/nfo/gmail-oauth-sinatra/blob/master/app.rb
* Fetch and evaluate more data like for authenticated users, e.g.
    * users followers https://api.github.com/users/yaph/followers
    * the last 10 commits for the 10 most recently updated repositories https://api.github.com/repos/yaph/coderstats/commits
    * Alternatively parse users RSS feed
    * Fetch data from coderwall provided user has specified the coderwall name into coderwall collection
    * Allow data update if older than 24 hrs
* Delete account feature for authenticated users
* User RSS feed
* Don't display empty tabs
* More details on repos like collaborators http://developer.github.com/v3/repos/collaborators/

## Weight calculation for repo

Think about implications, e.g. user confusion, when weighting repos before
implementing this. Weighting has to be explained and the explanation must be easy
to find.

* weight = repo * size
  if now - updated_at > six_months
    subtract 10%
  else if now - created_at > two_years
    add 10%

## Other Services to consider
* http://confluence.atlassian.com/display/BITBUCKET
* http://www.ohloh.net/api/getting_started
