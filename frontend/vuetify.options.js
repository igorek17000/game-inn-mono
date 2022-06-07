import colors from "vuetify/es5/util/colors";

export default {
  breakpoint: {
    thresholds: {
      xs: 280,
      sm: 540,
      md: 960,
      lg: 1300,
    },
    scrollBarWidth: 24,
  },
  icons: {},
  lang: {},
  theme: {
    dark: false,
    options: { customProperties: true },
    themes: {
      light: {
        anchor: "#000000",
        primary: colors.blue.darken2,
        accent: colors.grey.darken3,
        secondary: colors.amber.darken3,
        info: colors.teal.lighten1,
        warning: colors.amber.base,
        error: colors.deepOrange.accent4,
        success: colors.green.accent3,
        main_black: '#161616',
        main_gray: '#222222',
        main_red: '#FC1531',
        main_dark_black: '#000000',
        main_white: '#ffffff',
        main_dark_white: '#FFFFFF90',
      }
    }
  }
}
