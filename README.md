[![Build Status](http://img.shields.io/travis/pikesley/astley.svg?style=flat-square)](https://travis-ci.org/pikesley/astley)
[![Coverage Status](http://img.shields.io/coveralls/pikesley/astley.svg?style=flat-square)](https://coveralls.io/r/pikesley/astley)
[![Code Climate](http://img.shields.io/codeclimate/github/pikesley/astley.svg?style=flat-square)](https://codeclimate.com/github/pikesley/astley)
[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://pikesley.mit-license.org)

# Astley

It started with some idle chat in a Slack channel, which gave rise to the first Rick Roll stickers. Then somebody suggested some stickers that Rick Rolled via bit.ly so we could do some analytics, so we made those, too. Then we had analytics data and we needed something to do with it. So here we are

## Installing it

I can't believe anybody else will ever use this, but:

    git clone https://github.com/pikesley/astley
    cd astley
    bundle

Then you need to fill in `.env` file with

    token: bitly_api_token
    link: http://bit.ly/some_bitly_link
    tz_offset: 0
    interval: 5 # grab this many minutes of data
    consumer_key: twitter_consumer_key
    consumer_secret: twitter_consumer_secret
    twitter_token: twitter_token
    twitter_secret: twitter_secret

See [this](https://github.com/twitter/twurl/blob/master/README) if you need help on getting the Twitter credentials. I set the `interval` to 5 minutes, then I'm running this out of `cron` every 5 minutes like

    */5 * * * *	cd /home/astley/astley && bundle exec rake tweet >> log/rickroll.log

And it Tweets [here](https://twitter.com/rick_roll_bot)

I might also make a [Bothan](https://bothan.io/) dashboard

Thanks to [@floppy](https://twitter.com/floppy), [@pezholio](https://twitter.com/pezholio) and [@jgjay](https://twitter.com/jgjay) for all the ideas
