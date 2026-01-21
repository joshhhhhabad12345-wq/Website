import React from 'react';
import { MessageCircle, Heart, Share2, ExternalLink } from 'lucide-react';
import { Button } from './ui/Button';

export const CommunityView: React.FC = () => {
  return (
    <div className="flex flex-col items-center justify-center min-h-[80vh] px-4 animate-in fade-in slide-in-from-right-8 duration-700 w-full max-w-5xl mx-auto">
      
      <div className="text-center mb-16">
        <h2 className="text-5xl md:text-7xl font-bold mb-6 font-sans text-white uppercase tracking-tighter drop-shadow-[0_0_15px_#ff0000]">
          Join The <span className="text-blood-500">Empire</span>
        </h2>
        <p className="text-gray-400 text-xl max-w-2xl mx-auto font-light">
          Stay updated with the latest scripts, giveaways, and community events. Support us to keep Project X free and premium.
        </p>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-8 w-full">
        
        {/* Discord Card */}
        <div className="group relative bg-[#5865F2]/10 border border-[#5865F2]/30 p-8 rounded-lg overflow-hidden hover:bg-[#5865F2]/20 transition-all duration-300 hover:border-[#5865F2] hover:shadow-[0_0_30px_rgba(88,101,242,0.4)] flex flex-col items-center text-center">
          <div className="absolute top-0 right-0 p-4 opacity-10 group-hover:opacity-20 transition-opacity">
            <MessageCircle className="w-32 h-32" />
          </div>
          
          <div className="bg-[#5865F2] p-4 rounded-full mb-6 shadow-lg shadow-[#5865F2]/50 group-hover:scale-110 transition-transform duration-300">
            <MessageCircle className="w-10 h-10 text-white" />
          </div>
          
          <h3 className="text-3xl font-bold text-white mb-2 font-sans">DISCORD</h3>
          <p className="text-blue-200 mb-8 z-10">
            Join the hub for support, updates, and community chats. Help us grow by inviting your friends!
          </p>
          
          <a href="https://discord.gg/projectxhub" target="_blank" rel="noopener noreferrer" className="w-full z-10">
            <Button className="w-full bg-[#5865F2] border-[#5865F2] hover:bg-[#4752c4] hover:shadow-[0_0_20px_#5865F2]" icon={ExternalLink}>
              Join Server
            </Button>
          </a>
        </div>

        {/* TikTok Card */}
        <div className="group relative bg-zinc-900/50 border border-pink-500/30 p-8 rounded-lg overflow-hidden hover:bg-zinc-900/80 transition-all duration-300 hover:border-pink-500 hover:shadow-[0_0_30px_rgba(236,72,153,0.4)] flex flex-col items-center text-center">
          <div className="absolute top-0 right-0 p-4 opacity-10 group-hover:opacity-20 transition-opacity">
            <Share2 className="w-32 h-32" />
          </div>

          <div className="bg-gradient-to-br from-cyan-400 to-pink-500 p-4 rounded-full mb-6 shadow-lg shadow-pink-500/50 group-hover:scale-110 transition-transform duration-300">
            <svg viewBox="0 0 24 24" fill="currentColor" className="w-10 h-10 text-white">
              <path d="M19.59 6.69a4.83 4.83 0 0 1-3.77-4.25V2h-3.45v13.67a2.89 2.89 0 0 1-5.2 1.74 2.89 2.89 0 0 1 2.31-4.64 2.93 2.93 0 0 1 .88.13V9.4a6.84 6.84 0 0 0-1-.05A6.33 6.33 0 0 0 5 20.1a6.34 6.34 0 0 0 10.86-4.43v-7a8.16 8.16 0 0 0 4.77 1.52v-3.4a4.85 4.85 0 0 1-1-.1z" />
            </svg>
          </div>
          
          <h3 className="text-3xl font-bold text-white mb-2 font-sans">TIKTOK</h3>
          <p className="text-pink-200 mb-8 z-10">
            Follow @useprojectx for showcases, tutorials, and sneak peeks. Support our content!
          </p>
          
          <a href="https://www.tiktok.com/@useprojectx" target="_blank" rel="noopener noreferrer" className="w-full z-10">
            <Button className="w-full bg-black border-pink-500 hover:bg-zinc-900 hover:shadow-[0_0_20px_#ec4899]" icon={Heart}>
              Follow Us
            </Button>
          </a>
        </div>
      </div>

    </div>
  );
};