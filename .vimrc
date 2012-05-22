set nomodeline
:syntax on
":set background=dark
:set softtabstop=4
:set shiftwidth=4
:set tabstop=4
:set expandtab
:set ruler
:set showmatch
:set pastetoggle=<f5>

":set foldmethod=syntax
"SOMETHING IS BUGGED WITH :set number ... when opening a fold, gives seg fault
":set number

:set cursorline
":set backspace=eol,indent,start
":autocmd BufWritePre * :%s/\s\+$//e
":autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe 'normal g"\'' | endif





:set hls
:set nomodeline
colorscheme elflord
"colorscheme sea
let perl_want_scope_in_variables=1
let perl_extended_vars=1
let perl_include_pod=1
let perl_fold=1
hi Folded ctermfg=red
set smartindent
set wildmenu
"perlsupport
filetype plugin on
let g:Perl_AuthorName      = 'Name'
let g:Perl_AuthorRef       = 'NAME'
let g:Perl_Email           = 'email@mail.com'
let g:Perl_Company         = 'Company Name'

"freebsd set nocp
:set nocp
:set statusline=%<%f\ %y[%{&ff}]%m%r%w%a\ %=%l/%L,%c%V\ %P


"restarta o vimrc
autocmd! bufwritepost .vimrc source %
"IDENTACAO VERTICAL
":set list
":set listchars=tab:|
"VIM MINI BUFFER
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
"CTAGS - RELOAD abbreviations without restart vim, just type: :source $MYVIMRC
:ab cakeredirect $this->redirect('controller'=>'','action'=>'',$id);
:ab divclear <div style="clear:both;"></div>
:ab cstash $c->stash();
:ab cdebug $c->log->debug('');
:ab myselfc my ( $self, $c ) = @_;
:ab myself my ( $self ) = @_;
:ab credir $c->res->redirect($c->uri_for('/'));
:ab formhandlernew my $form = HTML::FormHandler->new( field_list =><cr>    [<cr>field => { type => '', label => '',<cr>required => 1,<cr>required_message => 'Campo obrigatório' ,<cr>},<cr>submit => {<cr>type => 'Submit', value => 'Salvar',<cr>},<cr>]);<cr><cr>if ($c->req->method eq 'POST') {<cr>$form->process( item => $obj, params => $c->req->params );<cr>}<cr> $c->stash( form => $form );<cr>return unless $form->validated;<cr>$c->flash( message => 'Alterações realizadas' );<cr>$c->response->redirect($c->uri_for('/'));
:ab btnexcluir <a class="btn1" href="javascript: void(0)" onclick="show_confirm()">Excluir Itens Selecionados<b></b></a><cr><script type="text/javascript"><cr>function show_confirm()<cr>{<cr>var r=confirm("Certeza ?");<cr>if (r==true)<cr>{<cr>$('#gridform').attr('action', '[% c.uri_for('destroy_multiple') %]'); document.gridform.submit();<cr>}<cr>else<cr>{<cr>}<cr>}<cr></script><cr>
"reload vimrc when it is saved:
au! BufWritePost .vimrc source %
:ab btnvoltar <a class="btn1" href="javascript:history.go(-1)">Voltar<b></b></a>
:ab emreq <em class="required">*</em>
:ab formnew <cr>label => '',<cr>required => 0,<cr>required_message => 'Campo Obrigatório',<cr>css_class => 'form50',<cr>
:ab modelfind $c->model('')->find();
:ab models $c->model('')->search( {  } , {  } );
:ab modelf $c->model('')->find({ } , { });
":ab çoes ções
":ab çao ção
:ab nao não
:ab ttwhile [% WHILE ( obj = .next)%]<cr>[% END %]
:ab cdetach $c->detach( );
:ab creqmethod $c->req->method eq
:ab cresbody $c->res->body('');
:ab jqueryajax $.ajax({<CR>url: '',<CR>cache: false,<CR>success: function (data) {<CR>},<CR>type: 'POST'<CR>});
:ab jqueryeach $.each(data, function(i,item){});
:ab documentready $(document).ready(function () {<cr>});
:ab fhtypeselect type => 'Select', <cr>options => [ { label => 35 , value => 35 } ],
:ab ttcomment [%# <!-- --> %]
:ab ttcreated [% item.created.day %]/[% item.created.month %]/[% item.created.year %]
:ab ResultSetClass package myApp::DBSchema::ResultSet::Foo;<CR>use strict;<CR>use warnings;<CR>use base 'DBIx::Class::ResultSet';<CR><CR>#sub example_last_10 {<CR>#USAGE: $c->model('DBICSchemamodel::Foo')->example_last_10();<CR>#   my ($self) = @_;<CR>#   return $self->find( # **** find OR search.... single/multiple<CR>#       { is_deleted => 0, },<CR>#       { order_by => 'created DESC', rows => 10, },<CR>#   );<CR>#}<CR><CR>1;
:ab subAction sub act_name :Action {<CR>my ( $self, $c ) = @_;<CR>}
:ab fhsubmit has_field 'submit' => ( type => 'Submit', css_class => 'form100', value => 'Salvar', );
:ab newcontroller package myapp::Controller::Name;<CR>use Moose;<CR>use namespace::autoclean;<CR>use utf8;<CR><CR>BEGIN {extends 'Catalyst::Controller'; }<CR><CR>__PACKAGE__->config(<CR> action => {<CR> list => { Chained => 'base', PathPart => q{list}, Args => 0 },<CR> view => { Chained => 'base' },<CR> edit => { Chained => 'base' },<CR> edit_ajax => { Chained => 'base' },<CR> destroy => { Chained => 'base' },<CR> destroy_multiple => { Chained => 'base' },<CR> },  <CR>);  <CR><CR>sub base : Chained('/') PathPart('name') CaptureArgs(0) {}<CR><CR>1;<CR>
:ab subbase sub base :Chained('/') :PathPart('base_path') :CaptureArgs(0) {}
:ab cmodelnew  $c->model(__PACKAGE__->config->{schema_model})->new({}); 
:ab packageconfig __PACKAGE__->config( schema_model => 'DBS::', );
:ab datadumper use Data::Dumper;<CR>Dumper $var;
:ab ttif [% IF %]
:ab ttelse [% ELSE %]
:ab ttend [% END %]
:ab treebuildernew my $tree= HTML::TreeBuilder::XPath->new;<CR>$tree->parse( $webpage_content );<CR>$tree->delete;
:ab mechanizenew use WWW::Mechanize;<CR>my $mech = WWW::Mechanize->new();<CR>$mech->agent_alias( 'Windows IE 6' );<CR>$mech->get( $url );<CR>my $content = $mech->content;<CR>
:ab xmlxpathnew use XML::XPath;<CR>use XML::XPath::XMLParser;<CR>my $xml = XML::XPath->new( xml => $content );<CR>foreach my $node_html ( $xml->findnodes( '//item', ) ) {<CR>    my $node_html_string = $node_html->toString ;<CR>    my $item_details = XML::XPath->new( xml => $node_html_string );<CR>    my $title = $item_details->findvalue( '//title',  );<CR>}<CR>
:ab jsanonsub (function (msg){alert(msg)})('SO');
:ab intervalo my $intervalo = DateTime::Duration->new( days => 7 );<CR>my $today = DateTime->now( time_zone=>'local' );
:ab dbicdump dbicdump -o dump_directory=./lib<CR>-o debug=1<CR>DBSchema<CR>'dbi:Pg:dbname=your_db_name'<CR>username<CR>pass
:ab dbicschema use lib "./lib";<CR>use DBSchema;<CR>my $schema = DBSchema->connect('dbi:Pg:dbname=DATABASE_NAME', 'USERNAME', 'PASSWORD');
:ab getoptslongnew use Getopt::Long;<CR>my $texto = '';<CR>my $res = GetOptions (<CR>'texto=s' => \$texto,           #STRING (s)<CR>);  
:ab moosehas has  => (<CR>is => '',<CR>isa => '',<CR>default => '',<CR>);
:ab hasisisadef has => (<CR>is => '',<CR>isa => '',<CR>default => '',<CR>);

set nomodeline
