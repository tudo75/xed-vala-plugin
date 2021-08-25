# project name and programming language
project('com.github.tudo75.xed-vala-plugin', ['vala', 'c'], version: '0.0.1')

cc = meson.get_compiler('c')

i18n = import('i18n')

add_global_arguments('-DGETTEXT_PACKAGE="@0@"'.format (meson.project_name()), language:'c')

vapi_dir = meson.current_source_dir() / 'vapi'

prefix = get_option('prefix')
bindir = get_option('bindir')
datadir = get_option('datadir')
libdir = get_option('libdir')
includedir = get_option('includedir')
libexecdir = get_option('libexecdir')
desktopdir = join_paths(datadir, 'applications')
schema_dir = join_paths(datadir, 'glib-2.0', 'schemas')
include_dirs = include_directories('.', 'xed')

add_project_arguments(['--vapidir', vapi_dir], language: 'vala')

dependencies = [
	dependency('gtk+-3.0', version: '>= 3.20'),
	dependency('glib-2.0'),
    dependency('gobject-2.0'),
	dependency('libpeas-1.0'),
	dependency('libpeas-gtk-1.0'),
	dependency('xed'), # need gtksourceview-4
]

pkgconfig = import('pkgconfig')

PKGCONFIG_DEPS = [
    'gtk+-3.0',
    'glib-2.0', 
    'gobject-2.0',
    'libpeas-1.0',
    'libpeas-gtk-1.0',
    'xed', # need gtksourceview-4
]

vapidir = get_option('datadir') / 'vala' / 'vapi'

add_project_arguments(['--enable-experimental'], language: 'vala')

vapi_dir = join_paths(meson.source_root(), 'build', 'src')

g_ir_compiler = find_program('g-ir-compiler', required: false)

subdir('po')
subdir('src')
subdir('data')