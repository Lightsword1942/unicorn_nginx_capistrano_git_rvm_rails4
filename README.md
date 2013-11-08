unicorn_nginx_capistrano_git_rvm_rails4
=======================================

I see a lot of people googling for the plumbing to put together smooth deploys.

Hopefully this will help you. I've straight plucked these out of my repo and 'generalized' them.

You'll need to pull/download, modify obvious variables, and put the files in their correct locations.

Please note that the unicorn.rake *does not* check properly to see if everything is running smoothly
with the new master process before issuing QUIT to the old process. That, I presume will be custom for 
each individual application.
