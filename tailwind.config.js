module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],

  theme: {
    screens: {
      'sm': '640px',
      // => @media (min-width: 640px) { ... }

      'md': '768px',
      // => @media (min-width: 768px) { ... }

      'lg': '1024px',
      // => @media (min-width: 1024px) { ... }

      'xl': '1280px',
      // => @media (min-width: 1280px) { ... }

      '2xl': '1536px',
      // => @media (min-width: 1536px) { ... }
    },

    extend: {
      colors: {
        ginkgo: {
          100: "#edebc7",
          500: "#e2dfa2",
          900: "#b4ad1e",
        },
        tomato: "#ed5752",
        sky: {
          100: "#f4f6f9",
          500: "#92aac7",
        },
        leaf: {
          100: "#f5f8f4",
          500: "#a1be95",
        },
      },
    },
  },
};
