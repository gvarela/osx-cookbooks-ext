git_settings = {
  'color.diff'              => 'auto',
  'color.status'            => 'auto',
  'color.branch'            => 'auto',
  'color.ui'                => 'auto',
  'color.branch.current'    => 'yellow reverse',
  'color.branch.local'      => 'yellow',
  'color.branch.remote'     => 'green',
  'color.diff.meta'         => 'yellow bold',
  'color.diff.frag'         => 'magenta bold',
  'color.diff.old'          => 'red bold',
  'color.diff.new'          => 'green bold',
  'color.diff.whitespace'   => 'red reverse',
  'color.status.added'      => 'yellow',
  'color.status.changed'    => 'green',
  'color.status.untracked'  => 'cyan',
  'core.whitespace'         => 'fix,-indent-with-non-tab,trailing-space,cr-at-eol',
  'core.autocrlf'           => 'input',
  'core.quotepath'          => 'false',
  'core.ignorecase'         => 'false',
  'alias.st'                => 'status',
  'alias.ci'                => 'commit',
  'alias.br'                => 'branch',
  'alias.co'                => 'checkout',
  'alias.df'                => 'diff',
  'alias.lg'                => 'log -p',
  'alias.br'                => 'branch',
  'alias.ls'                => 'branch',
  'alias.s'                 => 'status',
  'alias.a'                 => 'add',
  'alias.b'                 => 'branch',
  'alias.d'                 => 'diff',
  'alias.dc'                => 'diff --cached',
  'alias.v'                 => 'show',
  'alias.l'                 => 'log --pretty=oneline',
  'alias.ll'                => 'log',
  'alias.cp'                => 'cherry-pick',
  'alias.c'                 => 'checkout',
  'alias.cc'                => 'commit',
  'branch.autosetuprebase'  => 'always',
  'push.default'            => 'matching',
  'help.autocorrect'        => '1'
}

git_settings.each do |key, value|
  execute "git config --global #{key} \"#{value}\"" do
    action :run
    user ENV['SUDO_USER'] || ENV['USER']
  end
end