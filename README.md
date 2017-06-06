## analytics.wsu.edu

A project to publish website analytics for Washington State University. This is a fork of the public domain [analytics.usa.gov project](https://github.com/18F/analytics.usa.gov).

For a detailed description of how the site works, read [18F's blog post on analytics.usa.gov](https://18f.gsa.gov/2015/03/19/how-we-built-analytics-usa-gov/).

Other groups using this project for their analytics dashboards:
* https://analytics.usa.gov/
* http://analytics.phila.gov/
* https://bouldercolorado.gov/stats
* http://analytics.tdec.tn.gov/
* http://analytics.cityofsacramento.org/
* http://analytics.muni.org/
* http://analytics.smgov.net/

[This blog post details the 18F's implementations and lessons learned](https://18f.gsa.gov/2016/01/05/tips-for-adapting-analytics-usa-gov/).  

### Setup

Ths app uses [Jekyll](http://jekyllrb.com) to build the site, and [Sass](http://sass-lang.com/), [Bourbon](http://bourbon.io), and [Neat](http://neat.bourbon.io) for CSS.

Install them all using [bundler](http://bundler.io/):

```bash
bundle install --path vendor/bundle
```

[`analytics-reporter`](https://github.com/18F/analytics-reporter) is the code that powers the analytics dashboard.
Please clone the `analytics-reporter` next to a local copy of this github repository.

### Developing locally

Run Jekyll with development settings:

```bash
make dev
```

This runs `bundle exec jekyll serve --watch --config=_config.yml,_development.yml`, which will generate the final site output in `_site/`, start a local webserver at `http://127.0.0.1:4000`, and then regenerate `_site/` whenever files are modified.

### Developing with local data

The development settings assume data is available at `/fakedata`. You can change this in `_development.yml`.

### Developing with real live data from `analytics-reporter`

If also working off of local data, e.g. using `analytics-reporter`, you will need to make the data available over HTTP _and_ through CORS.

Various tools can do this. This project recommends using the Node module `serve`:

```bash
npm install -g serve
```

Generate data to a directory:

```
analytics --output [dir]
```

Then run `serve` from the output directory:

```bash
serve --cors
```

The data will be available at `http://localhost:3000` over CORS, with no path prefix. For example, device data will be at `http://localhost:3000/devices.json`.


### Deploying the app to production

In production, the site's base URL is set to `https://analytics.wsu.edu` and the data's base URL is set to `https://analytics.wsu.edu/data/live`.

To deploy this app to `analytics.wsu.edu`, you will need authorized access to the [Web Communication](https://web.wsu.edu) WSUWP Indie server.

To deploy the site once you have access, run:

```bash
make deploy
```

### Public domain

This project is in the worldwide [public domain](LICENSE.md). As stated in [CONTRIBUTING](CONTRIBUTING.md):

> This project is in the public domain within the United States, and copyright and related rights in the work worldwide are waived through the [CC0 1.0 Universal public domain dedication](https://creativecommons.org/publicdomain/zero/1.0/).
>
> All contributions to this project will be released under the CC0 dedication. By submitting a pull request, you are agreeing to comply with this waiver of copyright interest.
