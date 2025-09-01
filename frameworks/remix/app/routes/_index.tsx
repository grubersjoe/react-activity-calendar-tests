import { ActivityCalendar } from 'react-activity-calendar';
import 'react-activity-calendar/tooltips.css';
import { calendarProps } from '../../../props';

export default function Index() {
  return (
    <>
      <h3>Remix</h3>
      <ActivityCalendar {...calendarProps} />
    </>
  );
}
