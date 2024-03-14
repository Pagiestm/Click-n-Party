/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./assets/**/*.js",
    "./templates/**/*.html.twig",
  ],
  theme: {
    extend: {
      keyframes: {
        scroll: {
          '0%': { transform: 'translateX(0%)' },
          '100%': { transform: 'translateX(-100%)' },
        },
      },
      animation: {
        scroll: 'scroll 50s linear infinite',
      },
      colors: {
      'custom-green': '#F1FAF1',
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

