use client"

import {
  Sidebar,
  SidebarContent,
  SidebarFooter,
  SidebarGroup,
  SidebarHeader,
  SidebarMenu,
  SidebarMenuButton,
  SidebarMenuItem,
  SidebarProvider,
  SidebarTrigger,
} from "@/components/ui/sidebar"
import { Icons } from "@/components/icons"
import { usePathname, useRouter } from "next/navigation"
import { useTranslation } from "@/hooks/use-translation"
import { auth } from "@/lib/firebase/firebase"
import { signOut } from "firebase/auth"
import { useState } from "react"
import { toast } from "@/hooks/use-toast"
import { SettingsDialog } from "@/components/SettingsDialog"

interface SidebarLayoutProps {
  children: React.ReactNode
}

const SidebarLayout: React.FC<SidebarLayoutProps> = ({ children }) => {
  const pathname = usePathname()
  const router = useRouter()
  const { t } = useTranslation()
  const [isLogoutLoading, setIsLogoutLoading] = useState(false)

  const handleLogout = async () => {
    setIsLogoutLoading(true)
    try {
      await signOut(auth)
      toast({
        title: t('Logout'),
        description: t('You have been successfully logged out.'),
      })
      router.push('/')
    } catch (error: any) {
      console.error("Logout failed:", error)
      toast({
        variant: "destructive",
        title: t('Logout Failed'),
        description: t('Failed to log out: ') + error.message,
      })
    } finally {
      setIsLogoutLoading(false)
    }
  }

  const menuItems = [
    {
      href: '/learn',
      label: t('Learn'),
      icon: Icons.bookOpen,
    },
    {
      href: '/letters',
      label: t('Letters'),
      icon: Icons.bookOpen,
    },
    {
      href: '/numbers',
      label: t('Numbers'),
      icon: Icons.bookOpen,
    },
    {
      href: '/animals',
      label: t('Animals'),
      icon: Icons.bookOpen,
    },
        {
      href: '/colors',
      label: t('Colors'),
      icon: Icons.bookOpen,
    },
        {
      href: '/stories',
      label: t('Stories'),
      icon: Icons.bookOpen,
    },
  ]

  return (
    <SidebarProvider>
      <div className="flex h-screen">
        <Sidebar
          width="18rem"
          collapsible="icon"
          defaultOpen
          variant="inset"
          side="left"
        >
          <SidebarHeader>
            <div className="space-y-2">
              <h1 className="scroll-m-20 pb-2 text-3xl font-semibold tracking-tight transition-colors first:mt-0">
                EduKids
              </h1>
              <p className="text-sm text-muted-foreground">
                {t('Dashboard')}
              </p>
            </div>
          </SidebarHeader>
          <SidebarContent>
            <SidebarMenu>
              {menuItems.map((item) => (
                <SidebarMenuItem key={item.href}>
                  <SidebarMenuButton
                    variant="ghost"
                    onClick={() => router.push(item.href)}
                    isActive={pathname === item.href}
                  >
                    <item.icon className="mr-2 h-4 w-4" />
                    <span>{item.label}</span>
                  </SidebarMenuButton>
                </SidebarMenuItem>
              ))}
            </SidebarMenu>
          </SidebarContent>
          <SidebarFooter>
            <SidebarGroup>
              <SettingsDialog />
            </SidebarGroup>
            <SidebarGroup>
              <SidebarMenuItem>
                <SidebarMenuButton onClick={handleLogout} disabled={isLogoutLoading}>
                  <span>{isLogoutLoading ? t('Logging out...') : t('Logout')}</span>
                </SidebarMenuButton>
              </SidebarMenuItem>
            </SidebarGroup>
          </SidebarFooter>
        </Sidebar>
        <div className="flex-1 p-4">{children}</div>
      </div>
    </SidebarProvider>
  )
}

export default SidebarLayout;
