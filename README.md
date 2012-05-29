# Duraflame

A command line tool that converts Campfire transcripts to an IRC log format. Allows you to run [pisg](http://pisg.sourceforge.net/) (Perl IRC Statistics Generator) on your Campfire conversations.

## Installation

`gem install duraflame`

## Usage

```
duraflame [arguments]
  -c, --company=COMPANY            As in http://{company}.campfirenow.com
  -t, --token=TOKEN                Authentication token
  -r, --room=ROOM                  Room ID
  -o, --output-dir=DIRECTORY       Directory where log files will be written
  -s, --start-date=DATE            Start date, defaults to today
  -e, --end-date=DATE              End date, defaults to today
```

All arguments are required except for start and end dates, which default to today's date.

For example:

`duraflame -c your_company -t your_auth_token96be2812d5367c97f2c87e545 -r 1234 -o campfire_logs --start-date 2012-05-25`

This command will download transcripts from May 25, 2012 through today.

Then run pisg:

`pisg -ch 'Room 1' -d campfire_logs -f irssi`

## Todo
* Improve performance (fetch transcripts concurrently, operate on streams)
* Fetch transcripts for multiple rooms
