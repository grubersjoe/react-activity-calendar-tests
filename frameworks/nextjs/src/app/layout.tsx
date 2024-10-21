import './styles.css';

export default function Layout({ children }: { children: React.ReactNode }) {
  return (
    <html>
      <title>Next.js</title>
      <body>{children}</body>
    </html>
  );
}
