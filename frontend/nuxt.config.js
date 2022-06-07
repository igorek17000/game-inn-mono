require('dotenv').config({
  path: '.env',
});

export default {
  ssr: false,
  target: 'static',
  // server: {
  //   port: 3000,
  //   host: '0.0.0.0',
  // },
  head: {
    title: 'GameInn',
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: '' },
    ],
    link: [
      { rel: 'icon', type: 'image/x-icon', href: '/favicon.svg' },
      { rel: 'stylesheet', href: 'https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;700&display=swap' },
    ],
  },
  rootDir: __dirname,
  css: [
    { src: '@/assets/scss/styles.scss', lang: 'scss' },
    './styles/style.css'
  ],
  plugins: [
    { src: '@plugins/axios.js' },
    { src: '@plugins/main.js' },
  ],
  components: true,
  buildModules: [
    // Doc: https://github.com/nuxt-community/eslint-module
    '@nuxtjs/eslint-module',
    '@nuxtjs/dotenv',
    '@nuxtjs/vuetify',
    '@nuxtjs/moment',
  ],

  vuetify: {
    customVariables: ['@/assets/variables.scss'],
    optionsPath: './vuetify.options.js',
    treeShake: true,
  },

  styleResources: {
    scss: ['@/assets/scss/styles.scss'],
  },
  modules: [
    '@nuxtjs/axios',
    '@nuxtjs/style-resources',
    '@nuxtjs/color-mode',
  ],
  build: {
    extend(config) {
      config.node = {
        child_process: "empty",
        fs: 'empty',
      };
    },
    babel: {
      compact: false,
    },
  },
  axios: {
    baseURL: process.env.BASE_URL || '/api',
  },
  loading: {
    color: '#FC1531',
    height: '5px',
  },
  router: {
    linkActiveClass: 'nav-active'
  }
};
