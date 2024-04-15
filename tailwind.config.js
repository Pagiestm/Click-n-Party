/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./assets/**/*.js",
    "./templates/**/*.html.twig",
  ],
  theme: {
    extend: {
      fontFamily: {
        'cotorisBold': ['CotorisBold'],
        'cotoris': ['Cotoris'],
        'cotorisHeavy': ['CotorisHeavy'],
      },
      keyframes: {
        scroll: {
          '0%': { transform: 'translateX(0%)' },
          '100%': { transform: 'translateX(-100%)' },
        },
        fadeIn: {
          '0%': { opacity: '0' },
          '100%': { opacity: '1' }
        },
        slideDown: {
          '0%': { transform: 'translateY(-100%)', opacity: '0' },
          '10%': { transform: 'translateY(0)', opacity: '1' },
          '90%': { transform: 'translateY(0)', opacity: '1' },
          '100%': { transform: 'translateY(-100%)', opacity: '0' },
        },
      },
      animation: {
        scroll: 'scroll 50s linear infinite',
        'fade-in': 'fadeIn 2s ease-in forwards',
        'slide-down': 'slideDown 5s ease-in-out',
      },
      colors: {
        'custom-green': '#F1FAF1',
        'custom-green-light': '#D9ECD8',
        'custom_boutton': '#A0CB9E',
        'custom_green_dark': '#053F31',
      },
      width: {
        'fit-content': 'fit-content',
      },
    },
  },
  plugins: [],
}

