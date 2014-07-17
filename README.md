# hubot-omikuji

A Hubot script for omikuji.

## Installation

    $ npm install git://github.com/bouzuya/hubot-omikuji.git

or

    $ # TAG is the package version you need.
    $ npm install 'git://github.com/bouzuya/hubot-omikuji.git#TAG'

## Configuration

    $ export HUBOT_OMIKUJI_INITIAL_DATA='{"default":["凶","吉","大吉"]}'

## Commands

    bouzuya> hubot help omikuji
    hubot> hubot omikuji [<name>] - display omikuji

    bouzuya> hubot omikuji
    hubot> 大吉

    bouzuya> hubot omikuji default
    hubot> 大吉

    # export HUBOT_OMIKUJI_INITIAL_DATA='{"reviewer":["bouzuya","emanon001"]}'
    bouzuya> hubot omikuji reviewer
    hubot> bouzuya

## License

MIT

## Badges

[![Build Status][travis-status]][travis]

[travis]: https://travis-ci.org/bouzuya/hubot-omikuji
[travis-status]: https://travis-ci.org/bouzuya/hubot-omikuji.svg?branch=master
