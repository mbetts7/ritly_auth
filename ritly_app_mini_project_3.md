##Ritly

You are going to build an app similar to Bitly, called Ritly. The challenge is going to be understanding the flow of control in a Rails app.  

####Description of App

Visitors to Ritly will be able to request a randomly generated code for their URL link and save it to the database.  

Visitors to Ritly can go to localhost:3000/go/random_generated_code and the application will redirect them to the matched link in the database.  

Visitors to Ritly can go to localhost:3000/go/random_generated_code/preview and preview the URL to which they would be redirected.  

####Instructions

We are going to stimulate your understanding of Rails through experience. With the description and demo above build Ritly. Use the hints below to help you build.

####Here are a few hints.

**The URLs Table**  


|id |            link	            | random_string|               created at              |             updated at             |
|---|-----------------------------|--------------|---------------------------------------|------------------------------------|
|1	| http://www.generalassemb.ly	|  m1gpLHq8aoY | Wed, 19 Jun 2013 21:23:30 UTC +00:00	|Wed, 19 Jun 2013 21:23:30 UTC +00:00|
|2	| http://www.google.com	      |  T7DViXiIxFE | Wed, 19 Jun 2013 21:25:32 UTC +00:00	|Wed, 19 Jun 2013 21:25:32 UTC +00:00|
|3	| http://www.bustedtees.com	  |  pxMpvdB8LRw | Wed, 19 Jun 2013 21:23:30 UTC +00:00	|Wed, 19 Jun 2013 21:23:30 UTC +00:00|


**The Routes**  
Think about the different pages and actions that exist on Ritly.  

- Make sure you have a root
- Allow new URLs to be created and displayed
- URL redirection and URL previewing are separate actions
- Make sure you know the purpose of every entry in the result of `rake routes`

**The Views**  

*show.html.erb*  

Visitors are redirected to the show page after they request a randomly generated code for their URL link.
This view will display the random code that was generated: "Your code is: random_code" Go to localhost:3000/go/random_code to visit your URL.

DRY up your views by using partials. Make this a habit.

**Generating a Random String**  

Use SecureRandom.urlsafe_base64(length_of_string) to help you generate a random string.

**Bonus:**  

Make the preview or url show page contain the number of times someone has used that redirect.

Allow the user creating the redirect to give a string to use as the shortened string.  (localhost:3000/go/my_string redirects to my_url). Make sure to think about possible problems this could cause.

Make the preview page contain a preview of the content at the url, not just the target url.

Make everything gorgeous.

