/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./public/**/*.html", "./views/**/*.handlebars"],
  theme: {
    extend: {
      colors: {
        'rosa-site':'#e02b7b',
      },
      height:{
        '128': '32rem',
        '160': '40rem'
      },
      screens:{
        'ultrawide': '2160px'
      }
    },
  },
  plugins: [],
}
