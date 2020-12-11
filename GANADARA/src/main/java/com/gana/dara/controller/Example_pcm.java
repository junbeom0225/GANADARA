package com.gana.dara.controller;

import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;
import java.util.function.IntPredicate;

import javax.sound.sampled.AudioFileFormat;
import javax.sound.sampled.AudioFormat;
import javax.sound.sampled.AudioInputStream;
import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.UnsupportedAudioFileException;

import org.python.core.PyFunction;
import org.python.util.PythonInterpreter;

import com.google.gson.Gson;

public class Example_pcm {

	//private static PythonInterpreter intPre;
	
	private static final AudioFormat FORMAT = new AudioFormat(16000, 16, 1, true, false);

	public static byte[] formatAudioToWav(final byte[] audioFileContent,  final AudioFormat audioFormat) throws  IOException, UnsupportedAudioFileException {

		final AudioInputStream originalAudioStream = AudioSystem.getAudioInputStream(new ByteArrayInputStream(audioFileContent));
        final AudioInputStream formattedAudioStream = AudioSystem.getAudioInputStream(audioFormat, originalAudioStream);
        final AudioInputStream lengthAddedAudioStream = new AudioInputStream(formattedAudioStream, audioFormat, audioFileContent.length);
        final ByteArrayOutputStream convertedOutputStream = new ByteArrayOutputStream();
            	
        AudioSystem.write(lengthAddedAudioStream, AudioFileFormat.Type.WAVE, convertedOutputStream);
        return convertedOutputStream.toByteArray();
        }
	
	public static byte[] convertToPcm() {
		int totalFramesRead = 0;
		File fileIn = new File("/Users/cheryl/Downloads/zoo.wav");
		
		byte[] audioBytes = null;
		
		//AudioInputStream a = AudioSystem.getAudioInputStream(new BufferedInputStream(in, size));
		
		try {
		       AudioInputStream audioInputStream = AudioSystem.getAudioInputStream(fileIn);
		       System.out.println(audioInputStream.toString());
		       int bytesPerFrame = audioInputStream.getFormat().getFrameSize();
		       if (bytesPerFrame == AudioSystem.NOT_SPECIFIED) {
		           // some audio formats may have unspecified frame size
		           // in that case we may read any amount of bytes
		           bytesPerFrame = 1;
		       }
		       System.out.println(bytesPerFrame);
		       // Set an arbitrary buffer size of 1024 frames.
		       int numBytes = 1024 * bytesPerFrame;
		       audioBytes = new byte[numBytes];
		       System.out.println(audioBytes + " : [1024 * bytesPerFrame]" );
		       try {
		           int numBytesRead = 0;
		           int numFramesRead = 0;
		           // Try to read numBytes bytes from the file.


		           while ((numBytesRead = audioInputStream.read(audioBytes)) != -1) {
		               // Calculate the number of frames actually read.
		               numFramesRead = numBytesRead / bytesPerFrame;
		               totalFramesRead += numFramesRead;
		           }		           
		       } catch (Exception e) {
				// TODO: handle exception
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		byte[] pcmBytes = new byte[totalFramesRead];
		System.out.println(pcmBytes + " : pcmBytes?");
		return audioBytes;
	}

	static public void main(String[] args) throws IOException {

//    	intPre = new PythonInterpreter();
//    	intPre.execfile("src/main/com/gana/dara/controller/test.py");
//    	
//    	PyFunction pyFun = (PyFunction)intPre.get("turnIntoPCM",PyFunction.class);

		// String openApiURL = "http://aiopen.etri.re.kr:8000/WiseASR/Pronunciation"; //
		// 영어
		String openApiURL = "http://aiopen.etri.re.kr:8000/WiseASR/PronunciationKor"; // 한국어
		String accessKey = "6c1403cd-c929-43bd-be67-42d4ec745966"; // 발급받은 API Key
		String languageCode = "korean"; // 언어 코드
		//String script = "when shall i pay for it now or at check out time."; // 평가 대본
		String script = "동물원";
		//String audioFilePath = "/Users/cheryl/Downloads/PRO_M_20csg0029.pcm";
		String audioFilePath = "/Users/cheryl/Downloads/zoo.wav"; // 녹음된 음성 파일 경로
		String audioContents = null;

		Gson gson = new Gson();

		Map<String, Object> request = new HashMap<String, Object>();
		Map<String, String> argument = new HashMap<String, String>();

		Path path = Paths.get(audioFilePath);
		//System.out.println(path);
		byte[] audioBytes = Files.readAllBytes(path);
				//convertToPcm();
				//Files.readAllBytes(path);
		System.out.println(audioBytes + " files.readAllBytes(path)");
		byte[] test = convertToPcm();
		
		byte[] pcmBytes = null;
//			try {
//				pcmBytes = formatAudioToWav(audioBytes, FORMAT);
//			} catch (UnsupportedAudioFileException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//			
			//pcmBytes = Arrays.copyOfRange(test, 44, test.length);
		//System.out.println(pcmBytes + " : last convert?");
		audioContents = Base64.getEncoder().encodeToString(test);

		argument.put("language_code", languageCode);
		argument.put("script", script);
		argument.put("audio", audioContents);

		request.put("access_key", accessKey);
		request.put("argument", argument);

		URL url;
		Integer responseCode = null;
		String responBody = null;
		try {
			url = new URL(openApiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("POST");
			con.setDoOutput(true);

			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			wr.write(gson.toJson(request).getBytes("UTF-8"));
			wr.flush();
			wr.close();

			responseCode = con.getResponseCode();
			InputStream is = con.getInputStream();
			byte[] buffer = new byte[is.available()];
			int byteRead = is.read(buffer);
			responBody = new String(buffer);

			System.out.println("[responseCode] " + responseCode);
			System.out.println("[responBody]");
			System.out.println(responBody);

		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
