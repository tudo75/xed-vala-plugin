conf = configuration_data()
conf.set('prefix', get_option('prefix'))
conf.set('libdir', get_option ('libdir'))
conf.set('PROJECT_NAME', 'com.github.tudo75.xed-vala-plugin')
conf.set('PROJECT_VERSION', meson.project_version())

pluginsdatadir = join_paths(datadir, 'xed', 'plugins')
pluginslibdir = join_paths(libdir, 'xed', 'plugins')

sources = files(
    'vala-plugin.vala',
)

libvalaplugin = library(
    'ValaPlugin',
    sources,
    vala_header: 'vala-plugin.h',
    # vala_vapi: 'valaplugin-' + meson.project_version() + '.vapi',
    # vala_gir: 'valaplugin-' + meson.project_version() + '.gir',
    dependencies : dependencies,
    vala_args: [
        '--abi-stability'
    ],
    install: true,
    # link_with: libxed,
    include_directories: include_dirs,
    install_rpath: join_paths(prefix, libdir, 'xed'),
    install_dir: [
        join_paths(libdir, 'xed', 'plugins'),
        true,
        vapidir,
        # g_ir_compiler.found()
    ]
)

if g_ir_compiler.found()
    custom_target(
        'libvalaplugin-typelib',
        command: [
            g_ir_compiler,
            '--shared-library', 'libvalaplugin-@0@.so'.format (meson.project_version()),
            '--output', '@OUTPUT@',
            meson.current_build_dir() / 'valaplugin-' + meson.project_version() + '.gir'
        ],
        output: 'valaplugin-' + meson.project_version() + '.typelib',
        depends: libvalaplugin,
        install: false,
        install_dir: join_paths(get_option('libdir'), 'girepository-1.0')
    )
endif
