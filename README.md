[![codecov](https://codecov.io/gh/silva96/newslettex/branch/master/graph/badge.svg)](https://codecov.io/gh/silva96/newslettex) [![Build Status](https://travis-ci.org/silva96/newslettex.svg?branch=master)](https://travis-ci.org/silva96/newslettex)
# Newslettex

## For development
### To start your Phoenix server

- docker-compose up
- docker exec -it $(docker ps | grep 'newslettex_web' | awk '{print $1}') /bin/bash
- mix ecto.setup

### Testing

- MIX_ENV=test mix test --trace
- MIX_ENV=test mix coveralls.html

## License

Newslettex is released under the [MIT License](https://opensource.org/licenses/MIT).
