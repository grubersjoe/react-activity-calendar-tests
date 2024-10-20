import { ActivityCalendar } from "react-activity-calendar";

const data = [
  {
    date: "2023-06-01",
    count: 2,
    level: 1,
  },
  {
    date: "2023-07-01",
    count: 16,
    level: 4,
  },
  {
    date: "2024-04-01",
    count: 16,
    level: 3,
  },
];

export default function Home() {
  return (
    <>
      <h3>Next.js</h3>
      <ActivityCalendar
        data={data}
        theme={{ light: ["#eee", "violet"] }}
        showWeekdayLabels={["mon", "fri"]}
      />
    </>
  );
}
