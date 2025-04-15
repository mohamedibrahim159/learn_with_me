export const i18n = {
  defaultLocale: 'en',
  locales: ['en', 'ar'],
}

export const pathnames = {
  '/': '/',
  '/learn': {
    en: '/learn',
    ar: '/تعلم'
  }
}

export type Pathnames<T extends string> =
  keyof typeof pathnames | (T & {})
