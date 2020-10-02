module.exports = {
  future: {
    removeDeprecatedGapUtilities: true,
  },
  purge: [],
  theme: {
    extend: {
      boxShadow: {
        'stone-100': '0 0 0 2px #eaeaea',
      },
      colors: {
        berries: {
          '100': '##edd3d7',
          '200': '#e8bebe',
          '900': '#482830',
        },
        forrest: {
          '500': '#57696d',
        },
        sand: {
          '400': '#a19079',
          '500': '#887760',
        },
        sea: {
          '100': '#b3c7cb',
          '200': '#869fae',
          '300': '#738996',
          '400': '#5b6f7b',
          '800': '#2d4558',
          '900': '#1c2b36',
        },
        stone: {
          '100': '#eaeaea',
          '200': '#909090',
          '900': '#444444',
        },
      },
      flexGrow: {
        '2': 2,
      },
      flexShrink: {
        '2': 2,
      },
      height: {
        '128': '32rem',
      },
      spacing: {
        '0.5': '.125rem',
        '1.5': '.375rem',
        '2.5': '.625rem',
      },
    },
  },
  variants: {
    padding: ['responsive', 'first', 'last'],
    margin: ['responsive', 'first', 'last'],

  },
  plugins: [],
};
