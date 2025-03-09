import "./globals.css";

export const metadata = {
  title: "Pedro Lemos",
  description: "https://pedrolemoz.dev",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    // bg-zinc-950: background color
    // text-zinc-50: font color
    <html className="bg-zinc-950 text-zinc-50" lang="en">
      <body>{children}</body>
    </html>
  );
}
