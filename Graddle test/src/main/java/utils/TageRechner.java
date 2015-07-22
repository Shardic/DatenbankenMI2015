package utils;

import java.util.Date;

/**
 * Created by Konrad on 22.07.2015.
 */
public final class TageRechner {

    /**
     * Liefert die Anzahl der vergangenen Tage zwischen zwei java.sql.Dates zurück
     * @param starttag erstes datum
     * @param endtag zweites datum
     * @return long Tagesdifferenz
     */
    public static long getAnzahlTage(Date starttag, Date endtag) {
        long x = endtag.getTime() - starttag.getTime();
        return Math.round( (double)x / (24. * 60.*60.*1000.) );
    }


}
