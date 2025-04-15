use client";

import * as React from "react";
import { useTranslation } from "@/hooks/use-translation";
import {
  AlertDialog,
  AlertDialogAction,
  AlertDialogCancel,
  AlertDialogContent,
  AlertDialogDescription,
  AlertDialogFooter,
  AlertDialogHeader,
  AlertDialogTitle,
  AlertDialogTrigger,
} from "@/components/ui/alert-dialog";
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuLabel,
  DropdownMenuSeparator,
  DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu";
import { Settings } from "lucide-react";
import { useRouter } from "next/navigation";

export function SettingsDialog() {
  const { t, locale } = useTranslation();
  const router = useRouter();

  const handleLanguageChange = (newLocale: string) => {
    const currentPathname = window.location.pathname;
    const newPathname = currentPathname.replace(/^\/(en|ar)/, `/${newLocale}`);

    router.push(newPathname);
  };

  return (
    <AlertDialog>
      <AlertDialogTrigger asChild>
        <DropdownMenu>
          <DropdownMenuTrigger asChild>
              <DropdownMenuItem className="cursor-pointer">
                <Settings className="mr-2 h-4 w-4" />
                  {t('Settings')}
              </DropdownMenuItem>
          </DropdownMenuTrigger>
          <DropdownMenuContent className="w-56">
            <DropdownMenuLabel>{t("Account")}</DropdownMenuLabel>
            <DropdownMenuSeparator />
            <DropdownMenuItem>
              {t("Profile")}
            </DropdownMenuItem>
            <DropdownMenuItem>
              {t("Billing")}
            </DropdownMenuItem>
            <DropdownMenuItem>
              {t("Team")}
            </DropdownMenuItem>
            <DropdownMenuSeparator />
            <DropdownMenuItem>
              {t("Logout")}
            </DropdownMenuItem>
          </DropdownMenuContent>
        </DropdownMenu>
      </AlertDialogTrigger>
      <AlertDialogContent>
        <AlertDialogHeader>
          <AlertDialogTitle>{t('Choose Language')}</AlertDialogTitle>
          <AlertDialogDescription>
            {t('Select the language you prefer to use in EduKids.')}
          </AlertDialogDescription>
        </AlertDialogHeader>
        <AlertDialogFooter>
          <AlertDialogCancel>{t('Cancel')}</AlertDialogCancel>
          <AlertDialogAction onClick={() => handleLanguageChange('en')}>
            {t('English')}
          </AlertDialogAction>
          <AlertDialogAction onClick={() => handleLanguageChange('ar')}>
            {t('Arabic')}
          </AlertDialogAction>
        </AlertDialogFooter>
      </AlertDialogContent>
    </AlertDialog>
  );
}
