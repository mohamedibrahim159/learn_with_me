import type { Metadata } from 'next';
import { Geist, Geist_Mono } from 'next/font/google';
import '../../app/globals.css';
import { Toaster } from "@/components/ui/toaster";
import { siteConfig } from '@/config/site';
import SidebarLayout from '@/components/layout/SidebarLayout';

const geistSans = Geist({
    variable: '--font-geist-sans',
    subsets: ['latin'],
});

const geistMono = Geist_Mono({
    variable: '--font-geist-mono',
    subsets: ['latin'],
});

interface Props {
    children: React.ReactNode;
    params: { locale: string }
}

export async function generateStaticParams() {
    return [{ locale: 'en' }, { locale: 'ar' }]
}

export const metadata: Metadata = {
    title: siteConfig.name,
    description: siteConfig.description,
};

export default function RootLayout({ children, params: { locale } }: Props) {
    return (
        <html lang={locale}>
            <body className={`${geistSans.variable} ${geistMono.variable} antialiased`}>
                <SidebarLayout>
                  {children}
                </SidebarLayout>
                <Toaster />
            </body>
        </html>
    );
}
