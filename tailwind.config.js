module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  plugins: [require("daisyui")],
  daisyui: {
    darkTheme: false, // ダークモードをONにする場合は削除
    themes: ["winter"],
  },

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
        sky: {
          100: "#f4f6f9",
          500: "#92aac7",
        },
        leaf: {
          100: "#f5f8f4",
          500: "#a1be95",
        },
        tomato: "#ed5752",
        condition: "#cd7f99",
        belly: "#a1be95",
        meal: "#e2dfa2",
        poop: "#8b6646",
      },

      animation: {
        fuwafuwa: "fuwafuwa 3s ease-in-out infinite alternate",
        notice: "notice 7.0s forwards",
      },

      keyframes: {
        fuwafuwa: {
          '0%': {
            transform: 'translate(0, 0) rotate(-7deg)',
          },
          '50%': {
            transform: 'translate(0, -7px) rotate(0deg)',
          },
          '100%': {
            transform: 'translate(0, 0) rotate(7deg)',
          },
        },

        notice: {
          "0%": { transform: "translateX(180px)", opacity: 0 },
          "20%": { transform: "translateX(0)", opacity: 1 },
          "80%": { transform: "translateX(0)", opacity: 1 },
          "100%": { transform: "translateX(180px)", opacity: 0 },
        }
      },
    },
  },
};
