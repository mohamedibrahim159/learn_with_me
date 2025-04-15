import { useRouter } from 'next/navigation';
import { useMemo } from 'react';

const en = {
  'Welcome to EduKids!': 'Welcome to EduKids!',
  'Explore a world of learning and fun.': 'Explore a world of learning and fun.',
  'For Learners': 'For Learners',
  'Start your learning adventure here!': 'Start your learning adventure here!',
  'Continue as Guest': 'Continue as Guest',
  'Logging in...': 'Logging in...',
  'For Parents': 'For Parents',
  'Manage your child’s learning experience.': 'Manage your child’s learning experience.',
  'Login': 'Login',
  'Login Successful': 'Login Successful',
  'You have successfully logged in as a guest.': 'You have successfully logged in as a guest.',
  'Login Failed': 'Login Failed',
  'Failed to log in as a guest: ': 'Failed to log in as a guest: ',
  'Dashboard': 'Dashboard',
  'Learn': 'Learn',
  'Letters': 'Letters',
  'Numbers': 'Numbers',
  'Animals': 'Animals',
  'Colors': 'Colors',
  'Stories': 'Stories',
  'Settings': 'Settings',
  'Choose Language': 'Choose Language',
  'English': 'English',
  'Arabic': 'Arabic',
  'General': 'General',
  'Account': 'Account',
  'Logout': 'Logout'
};

const ar = {
  'Welcome to EduKids!': 'مرحبا بكم في EduKids!',
  'Explore a world of learning and fun.': 'استكشف عالماً من التعلم والمرح.',
  'For Learners': 'للمتعلمين',
  'Start your learning adventure here!': 'ابدأ مغامرتك التعليمية هنا!',
  'Continue as Guest': 'متابعة كزائر',
  'Logging in...': 'تسجيل الدخول...',
  'For Parents': 'للأهل',
  'Manage your child’s learning experience.': 'إدارة تجربة تعلم طفلك.',
  'Login': 'تسجيل الدخول',
  'Login Successful': 'تم تسجيل الدخول بنجاح',
  'You have successfully logged in as a guest.': 'لقد تم تسجيل دخولك بنجاح كزائر.',
  'Login Failed': 'فشل تسجيل الدخول',
  'Failed to log in as a guest: ': 'فشل تسجيل الدخول كزائر: ',
  'Dashboard': 'لوحة التحكم',
  'Learn': 'تعلم',
  'Letters': 'الحروف',
  'Numbers': 'الأرقام',
  'Animals': 'الحيوانات',
  'Colors': 'الألوان',
  'Stories': 'القصص',
  'Settings': 'الإعدادات',
  'Choose Language': 'اختر اللغة',
  'English': 'الإنجليزية',
  'Arabic': 'العربية',
  'General': 'عام',
  'Account': 'الحساب',
  'Logout': 'تسجيل الخروج'
};

type Translation = typeof en;

type Language = 'en' | 'ar';

const dictionaries: Record<Language, Translation> = {
  en,
  ar,
};

function useLocale() {
    const router = useRouter();
    return router.locale as Language || 'en';
}

export function useTranslation() {
  const locale = useLocale();

  const t = useMemo(
    () => (key: keyof Translation) => {
      return dictionaries[locale][key] || key;
    },
    [locale]
  );

  return { t, locale };
}
