Installation
============

These cookbooks can be used directly with chef-solo. I recommend using my handy helper script home_cookin (http://github.com/gvarela/home_cookin). This cookbook assumes using Josh Peek's osx-cookbooks (http://github.com/josh/osx-cookbooks).

To use with home_cookin you can create a dna.json file that looks similar to the one below.

        {
          "imagemagick": {"ghostscript": true},
          "redis": {"launchd": true},
          "rvm": {"rubies": ["rbx", "ree", "1.9.2"]},
          "homesick": {"repos": ["git://github.com/gvarela/dot_files.git"]},
          "basic_brew": {"formulae": ["bash-completion"]},

          "cookbooks": ["https://github.com/gvarela/osx-cookbooks/tarball/master",
                        "https://github.com/gvarela/osx-cookbooks-ext/tarball/master"],
          "recipes": [
                      "homebrew",
                      "git",
                      "rvm",
                      "node",
                      "mysql",
                      "redis",
                      "memcached",
                      "imagemagick",
                      "mvim",
                      "homesick",
                      "basic_brew"
                    ]
        }

Then run home_cookin

        sudo cook dna.json
