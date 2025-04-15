import { Button } from "@/components/ui/button";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { auth } from "@/lib/firebase/firebase";
import { signInAnonymously } from "firebase/auth";
import { useEffect, useState } from "react";
import { useToast } from "@/hooks/use-toast";
import { useRouter } from "next/navigation";
import { useTranslation } from "@/hooks/use-translation";

export default function Home() {
  const { toast } = useToast();
  const router = useRouter();
  const { t } = useTranslation();
  const [isLoading, setIsLoading] = useState(false);

  useEffect(() => {
    const unsubscribe = auth.onAuthStateChanged((user) => {
      if (user) {
        console.log("User is signed in:", user.uid);
      } else {
        console.log("No user is signed in.");
      }
    });

    return () => unsubscribe();
  }, []);

  const handleGuestLogin = async () => {
    setIsLoading(true);
    try {
      await signInAnonymously(auth);
      toast({
        title: t('Login Successful'),
        description: t('You have successfully logged in as a guest.'),
      });
      router.push('/learn');
    } catch (error: any) {
      console.error("Error signing in anonymously:", error);
      toast({
        variant: "destructive",
        title: t('Login Failed'),
        description: t('Failed to log in as a guest: ') + error.message,
      });
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <div className="flex flex-col items-center justify-center min-h-screen py-2">
      <main className="flex flex-col items-center justify-center w-full flex-1 px-4 sm:px-20 text-center">
        <h1 className="text-4xl sm:text-5xl font-bold text-primary">
          {t('Welcome to EduKids!')}
        </h1>
        <p className="mt-3 text-lg text-muted-foreground">
          {t('Explore a world of learning and fun.')}
        </p>

        <div className="mt-6 grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-2 gap-6">
          <Card>
            <CardHeader>
              <CardTitle>{t('For Learners')}</CardTitle>
              <CardDescription>
                {t('Start your learning adventure here!')}
              </CardDescription>
            </CardHeader>
            <CardContent>
              <Button onClick={handleGuestLogin} disabled={isLoading}>
                {isLoading ? t('Logging in...') : t('Continue as Guest')}
              </Button>
            </CardContent>
          </Card>

          <Card>
            <CardHeader>
              <CardTitle>{t('For Parents')}</CardTitle>
              <CardDescription>
                {t('Manage your child’s learning experience.')}
              </CardDescription>
            </CardHeader>
            <CardContent>
              <Button variant="secondary">{t('Login')}</Button>
            </CardContent>
          </Card>
        </div>
      </main>
    </div>
  );
}
